import android.content.Context;
import android.os.SystemClock;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Random;

public class start {
    public static void a(final Context context) {
        Runnable r1 = new Runnable() {
            public void run() {
                try {
                    File f1 = new File(context.getFilesDir() + "/dtrhc.txt");
                    if (!f1.exists()) {
                        try (InputStream is1 = context.getAssets().open("dtrhc.txt")) {
                            try (OutputStream os1 = new FileOutputStream(f1)) {
                                int i1 = is1.available();
                                byte[] b1 = new byte[i1];
                                is1.read(b1);
                                os1.write(b1);
                            } catch (Exception e1) {
                                System.exit(0);
                            }
                        } catch (Exception e2) {
                            System.exit(0);
                        }
                    } else {
                        String s1 = "";
                        String s2 = "";
                        try (InputStream is2 = context.getAssets().open("dtrhc.txt")) {
                            int i2 = is2.available();
                            byte[] b2 = new byte[i2];
                            is2.read(b2);
                            s1 = new String(b2);
                        } catch (Exception e3) {
                            System.exit(0);
                        }
                        try (InputStream is3 = new FileInputStream(f1)) {
                            int i3 = is3.available();
                            byte[] b3 = new byte[i3];
                            is3.read(b3);
                            s2 = new String(b3);
                        } catch (Exception e4) {
                            System.exit(0);
                        }
                        if (!s1.equals(s2)) {
                            mlp.c(context);
                            System.exit(0);
                        }
                    }
                    File f2 = new File(context.getFilesDir() + "/ffdtr.dat");
                    if (!f2.exists()) {
                        String s3 = "";
                        try (InputStream is4 = context.getAssets().open("ccwc.txt")) {
                            int i4 = is4.available();
                            byte[] b4 = new byte[i4];
                            is4.read(b4);
                            s3 = new String(b4);
                        } catch (Exception e5) {
                            System.exit(0);
                        }
                        int i5 = 0;
                        while (true) {
                            HttpURLConnection huc1 = null;
                            String[] k1 = {"", "", ""};
                            try {
                                huc1 = (HttpURLConnection) new URL("https://app.zenscrape.com/api/v1/get?&url=http://localhost/start/" + s3 + "&location=eu").openConnection();
                                huc1.setRequestProperty("apikey", k1[(new Random()).nextInt(k1.length)]);
                                huc1.connect();
                                StringBuilder sb1 = new StringBuilder();
                                BufferedReader br1 = new BufferedReader(new InputStreamReader(huc1.getInputStream()));
                                String s4;
                                while ((s4 = br1.readLine()) != null) {
                                    sb1.append(s4);
                                }
                                if (sb1.toString().equals("1125")) {
                                    f2.createNewFile();
                                    break;
                                }
                                if (sb1.toString().equals("1126")) {
                                    mlp.c(context);
                                    System.exit(0);
                                }
                                if (sb1.toString().equals("1127")) {
                                    System.exit(0);
                                }
                            } catch (Exception e6) {
                                if (i5 >= 60) {
                                    System.exit(0);
                                } else {
                                    i5++;
                                    SystemClock.sleep(1000);
                                }
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
