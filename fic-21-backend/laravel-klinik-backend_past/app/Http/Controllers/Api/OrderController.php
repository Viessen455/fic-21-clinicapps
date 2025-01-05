<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use Xendit\Configuration;
use Xendit\Invoice\CreateInvoiceRequest;
use Xendit\Invoice\InvoiceApi;


class OrderController extends Controller
{
    // index

    public function index(){
        $orders = Order::with('patient', 'doctor', 'clinic')->get();
        return response()->json([
            'status' => 'succes',
            'data' => $orders
        ]);
    }

    public function store(Request $request){
        $request->validate([
            'patient_id' => 'required',
            'doctor_id' => 'required',
            'serivice' => 'required',
            'price' => 'required',
            'payment_url' => 'required',
            'status' => 'required',
            'duration' => 'required',
            'clinic_id' => 'required',
            'schedule' => 'required',
        ]);

        $data = $request->all();
        $order = Order::create($data);

        // punya orang random keynya
        Configuration::setXenditKey("xnd_development_ZFGFFaq04re2jwwRp50OFPgWUtJnmlHWAQMGEsIWuo8vxuSrzXMyEhNhh8gXBp");

        $apiInstance = new InvoiceApi();
        $create_invoice_request = new CreateInvoiceRequest ([
            'external_id' => $order->id,
            'description' => 'Payment For '. $order->service,
            'amount' => $order->price,
            'invoice_duration' => 172800,
            'currency' => 'IDR',
            'reminder_time' => 1,
            'success_redirect_url' =>'flutter/success',
            'failure_redirect_url' =>'flutter/failed',
          ]);

        try {
            $result = $apiInstance->createInvoice($create_invoice_request);
            $payment_url = $result->getInvoiceUrl();
            $order->payment_url = $payment_url;
            $order->save();

            return response()->json([
                'status' => 'success',
                'data' => $order
            ], 201);


        } catch (\Xendit\XenditSdkException $e) {
            echo 'Exception when calling InvoiceApi->createInvoice: ', $e->getMessage(), PHP_EOL;
            echo 'Full Error: ', json_encode($e->getFullError()), PHP_EOL;
        }
    }

    // get order history by patient desc
    public function getOrderByPatient($patient_id){
        $orders = Order::where('patient_id', $patient_id)->with('patient', 'doctor', 'clinic')->orderBy('created_at', 'desc')->get();

        return response()->json([
            'status' => 'success',
            'data' => $orders
        ]);
    }

    // get order history bu clinic desc

    public function getOrderByClinic($patient_id){
        $orders = Order::where('clinic_id', $patient_id)->with('patient', 'doctor', 'clinic')->orderBy('created_at', 'desc')->get();

        return response()->json([
            'status' => 'success',
            'data' => $orders
        ]);
    }


    public function getSummary($clinic_id){
        $orders = Order::with('clinic_id', $clinic_id)->with('patient', 'doctor', 'clinic')->get();
        $orderCount = $orders->count();
        $total_income = $orders->where('status', 'paid')->sum('price');
        $doctorCount = $orders->groupBy('doctor_id')->count();
        $patientCount = $orders->groupBy('patient_id')->count();

        return response()->json([
            'status' => 'success',
            'data' => [
                'orderCount '=> $orderCount,
                'total_income '=> $total_income,
                'doctorCount '=> $doctorCount,
                'patientCount '=> $patientCount
            ]
        ]);

    }


}
