<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\User;
use Xendit\Configuration;
use Xendit\Invoice\CreateInvoiceRequest;
use Xendit\Invoice\InvoiceApi;
use Berkayk\OneSignal\OneSignalFacade as OneSignal;


class OrderController extends Controller
{
    //index
    public function index()
    {
        $orders = Order::with('patient', 'doctor', 'clinic')->get();
        return response()->json([
            'status' => 'success',
            'data' => $orders
        ]);
    }

    //store
    public function store(Request $request)
    {
        $request->validate([
            'patient_id' => 'required',
            'doctor_id' => 'required',
            'service' => 'required',
            'price' => 'required',
            'duration' => 'required',
            'clinic_id' => 'required',
            'schedule' => 'required',
            'status_service' => 'required',
        ]);

        $data = $request->all();

        $order = Order::create($data);
        //XENDIT_SERVER_KEY
        $xenditKey = 'xnd_development_ZFGFFaq04re2jwwRp50OFPgWUtJnmlHWAQMGEsIWuo8vxuSrzXMyEhNhh8gXBp';
        Configuration::setXenditKey($xenditKey);

        $apiInstance = new InvoiceApi();
        $create_invoice_request = new CreateInvoiceRequest([
            'external_id' => 'INV-' . $order->id,
            'description' => 'Payment for ' . $order->service,
            'amount' => $order->price,
            'invoice_duration' => 172800,
            'currency' => 'IDR',
            'reminder_time' => 1,
            'success_redirect_url' => 'flutter/success',
            'failure_redirect_url' => 'flutter/failure',
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

    //handle callback xendit
    public function handleCallback(Request $request)
    {
        //check header 'x-callback-token
        $xenditCallbackToken = env('XENDIT_CALLBACK_TOKEN', '');
        $callbackToken = $request->header('x-callback-token');
        if ($callbackToken != 'LiiQmaqlrSDE3K8SbujkxQ0Hx3n77gCWKcP1B0ACO88zVF9f') {
            return response()->json([
                'status' => 'error',
                'message' => 'Unauthorized'
            ], 401);
        }

        $data = $request->all();
        $externalId = $data['external_id'];
        $order = Order::where('id', explode('-', $externalId)[1])->first();
        $order->status = $data['status'];
        $order->status_service = 'Active';
        $doctor = User::find($order->doctor_id);
        $order->save();
        OneSignal::sendNotificationToUser(
            "You have a new " . $order->service . " from " . $order->patient->name,
            $doctor->one_signal_token,
            $url = null,
            $data = null,
            $buttons = null,
            $schedule = null
        );

        if ($data['status'] == 'Success') {
            //kirim notifikasi ke doctor
        }

        return response()->json([
            'status' => 'success',
            'data' => $order
        ]);
    }

    //get order history by patient desc
    public function getOrderByPatient($patient_id)
    {
        $orders = Order::where('patient_id', $patient_id)->with('patient', 'doctor', 'clinic')->orderBy('created_at', 'desc')->get();
        return response()->json([
            'status' => 'success',
            'data' => $orders
        ]);
    }

    //get order history by doctor desc
    public function getOrderByDoctor($doctor_id)
    {
        $orders = Order::where('doctor_id', $doctor_id)
            ->where('status_service', 'Done')->with('patient', 'doctor', 'clinic')->orderBy('created_at', 'desc')->get();
        return response()->json([
            'status' => 'success',
            'data' => $orders
        ]);
    }

    public function getOrderByDoctorQuery($doctor_id, $service, $status_service)
    {
        $orders = Order::where('doctor_id', $doctor_id)
            ->where('service', $service)
            ->where('status_service', $status_service)
            ->with('patient', 'doctor', 'clinic')->orderBy('created_at', 'desc')->get();
        return response()->json([
            'status' => 'success',
            'data' => $orders
        ]);
    }

    //get order history by clinic desc
    public function getOrderByClinic($clinic_id)
    {
        $orders = Order::where('clinic_id', $clinic_id)->with('patient', 'doctor', 'clinic')->orderBy('created_at', 'desc')->get();
        return response()->json([
            'status' => 'success',
            'data' => $orders
        ]);
    }

    //admin clinic summary
    public function getSummary($clinic_id)
    {
        $orders = Order::where('clinic_id', $clinic_id)->with('patient', 'doctor', 'clinic')->get();
        $orderCount = $orders->count();
        //total income order status paid
        $totalIncome = $orders->where('status', 'Success')->sum('price');
        //doctor count
        $doctorCount = $orders->groupBy('doctor_id')->count();
        //patient count
        $patientCount = $orders->groupBy('patient_id')->count();

        return response()->json([
            'status' => 'success',
            'data' => [
                'order_count' => $orderCount,
                'total_income' => $totalIncome,
                'doctor_count' => $doctorCount,
                'patient_count' => $patientCount,
            ]
        ]);
    }
}
