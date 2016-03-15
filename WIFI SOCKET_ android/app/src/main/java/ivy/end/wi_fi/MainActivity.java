package ivy.end.wi_fi;

import android.app.Service;
import android.content.DialogInterface;
import android.media.Ringtone;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.os.StrictMode;
import android.os.Vibrator;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.Socket;
import java.net.UnknownHostException;


public class MainActivity extends ActionBarActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder()
                .detectDiskReads()
                .detectDiskWrites()
                .detectNetwork()
                .penaltyLog()
                .build());
        StrictMode.setVmPolicy(new StrictMode.VmPolicy.Builder()
                .detectLeakedSqlLiteObjects()
                .detectLeakedClosableObjects()
                .penaltyLog()
                .penaltyDeath()
                .build());

        initView();
        initEvent();

        handler = new Handler() {
            @Override
            public void handleMessage(Message msg) {

                vibrator = (Vibrator)getApplication().getSystemService(Service.VIBRATOR_SERVICE);
                vibrator.vibrate(new long[] {100, 10, 100, 1000}, -1);

                Uri uri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION);
                Ringtone ringtone = RingtoneManager.getRingtone(getApplicationContext(), uri);
                ringtone.play();

                Toast.makeText(getBaseContext(), msg.obj.toString(), Toast.LENGTH_SHORT).show();
            }
        };

    }

    private void initView() {
        editText_IPAddress = (EditText)findViewById(R.id.editText_IPAddress);
        editText_Port = (EditText)findViewById(R.id.editText_Port);
        button_Connect = (Button)findViewById(R.id.button_Connect);
        button_LEDOn = (Button)findViewById(R.id.button_LEDOn);
        button_LEDOff = (Button)findViewById(R.id.button_LEDOff);
        button_AirOn = (Button)findViewById(R.id.button_AirOn);
        button_AirOff = (Button)findViewById(R.id.button_AirOff);
        button_MusOn = (Button)findViewById(R.id.button_MusOn);
        button_MusOff = (Button)findViewById(R.id.button_MusOff);
        button_Temperature = (Button)findViewById(R.id.button_temperature);
        button_Humidity = (Button)findViewById(R.id.button_humidity);
    }

    private void initEvent()
    {
        button_Connect.setOnClickListener(connect_OnClick);
        button_LEDOn.setOnClickListener(LEDOn_OnClick);
        button_LEDOff.setOnClickListener(LEDOff_OnClick);
        button_AirOn.setOnClickListener(AirOn_OnClick);
        button_AirOff.setOnClickListener(AirOff_OnClick);
        button_MusOn.setOnClickListener(MusOn_OnClick);
        button_MusOff.setOnClickListener(MusOff_OnClick);
        button_Temperature.setOnClickListener(Temperature_OnClick);
        button_Humidity.setOnClickListener(Humidity_OnClick);
    }

    private void connect(String ip, int port) {
        try {
            client = new Socket(ip, port);
            button_Connect.setEnabled(false);
            receiveThread = new ReceiveThread(client);
            start = true;
            receiveThread.start();
        } catch (UnknownHostException e) {
            Toast.makeText(this, e.getMessage(), Toast.LENGTH_LONG).show();
        } catch (IOException e) {
            Toast.makeText(this, e.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    private void close() {
        try {
            client.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void sendMsg(String msg) {
        byte[] buffer = null;

        try {
            buffer = msg.getBytes("GB2312");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        try {
            OutputStream outputStream = client.getOutputStream();
            outputStream.write(buffer);
            outputStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private class ReceiveThread extends Thread {
        private InputStream inputStream = null;

        private byte[] buffer;
        private String str = null;

        ReceiveThread(Socket s) {
            try {
                this.inputStream = s.getInputStream();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        @Override
        public void run() {
            while(start) {
                this.buffer = new byte[512];

                try {
                    this.inputStream.read(this.buffer);
                } catch (IOException e) {
                    e.printStackTrace();
                }

                try {
                    this.str = new String(this.buffer, "GB2312").trim();
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }

                Message msg = new Message();
                msg.obj = this.str;
                handler.sendMessage(msg);
            }
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();

        if(receiveThread != null) {
            start = false;
            receiveThread.interrupt();
            close();
        }
    }

    View.OnClickListener connect_OnClick = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            ipAddress = editText_IPAddress.getText().toString();
            port = editText_Port.getText().toString();
            connect(ipAddress, Integer.parseInt(port));
        }
    };

    View.OnClickListener LEDOn_OnClick = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            sendMsg("*LED1*");
        }
    };

    View.OnClickListener LEDOff_OnClick = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            sendMsg("*LED0*");
        }
    };

    View.OnClickListener AirOn_OnClick = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            sendMsg("*FAN1*");
        }
    };

    View.OnClickListener AirOff_OnClick = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            sendMsg("*FAN0*");
        }
    };

    View.OnClickListener MusOn_OnClick = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            sendMsg("*MUS1*");
        }
    };

    View.OnClickListener MusOff_OnClick = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            sendMsg("*MUS0*");
        }
    };

    View.OnClickListener Temperature_OnClick = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            sendMsg("*TEM0*");
        }
    };

    View.OnClickListener Humidity_OnClick = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            sendMsg("*TEM1*");
        }
    };

    private String ipAddress, port;

    private Vibrator vibrator;

    private boolean start = false;
    private Handler handler;
    private ReceiveThread receiveThread;

    private EditText editText_IPAddress;
    private EditText editText_Port;
    private Button button_Connect;
    private Button button_LEDOn, button_LEDOff;
    private Button button_AirOn, button_AirOff;
    private Button button_MusOn, button_MusOff;
    private Button button_Temperature, button_Humidity;

    static Socket client;
}
