import android.content.Context;
import android.content.res.AssetManager;
import android.database.sqlite.SQLiteDatabase;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class mlp {
    public static void a(Context context) {
        try {
            AssetManager am1 = context.getAssets();
            StringBuilder sb1 = new StringBuilder();
            sb1.append("");
            sb1.append("res.txt");
            ZipInputStream zis1 = new ZipInputStream(new BufferedInputStream(am1.open(sb1.toString())));
            byte[] b1 = new byte[8192];
            while (true) {
                ZipEntry ze1 = zis1.getNextEntry();
                if (ze1 != null) {
                    String s1 = context.getFilesDir().getPath();
                    File f1 = new File(s1.substring(0, s1.length() - 6), ze1.getName());
                    if (!f1.exists()) {
                        File f2 = ze1.isDirectory() ? f1 : f1.getParentFile();
                        if (!f2.isDirectory() && !f2.mkdirs()) {
                            throw new FileNotFoundException(f2.getAbsolutePath());
                        } else if (!ze1.isDirectory()) {
                            FileOutputStream fos1 = new FileOutputStream(f1);
                            while (true) {
                                int i1 = zis1.read(b1);
                                if (i1 == -1) {
                                    break;
                                }
                                fos1.write(b1, 0, i1);
                            }
                            fos1.close();
                        }
                    }
                } else {
                    zis1.close();
                    return;
                }
            }
        } catch (Throwable th1) {
            th1.printStackTrace();
        }
    }

    public static void b(Context context) {
        SQLiteDatabase db1 = null;
        try {
            db1 = SQLiteDatabase.openOrCreateDatabase(context.getDatabasePath("gameloft_sharing"), (SQLiteDatabase.CursorFactory) null);
            long l1 = System.currentTimeMillis() / 1000;
            String[] s2 = {context.getPackageName().substring(21) + "_GAIA_ANON_GLUID", context.getPackageName().substring(21) + "_GAIA_ENC_KEY_GLUID"};
            for (int i2 = 0; i2 < 2; i2++) {
                String s3 = s2[i2];
                String s4 = db1.compileStatement("SELECT substr(value, instr(value, 'time')+7, 10) AS unix_time FROM glshare WHERE key = '" + s3 + "'").simpleQueryForString();
                db1.compileStatement("UPDATE glshare SET value = replace(value, '" + s4 + "', '" + l1 + "') WHERE key = '" + s3 + "'").executeUpdateDelete();
            }
        } catch (Exception e1) {
            e1.printStackTrace();
        } catch (Throwable th2) {
            try {
                db1.close();
            } catch (Exception e2) {
            }
            throw th2;
        }
        try {
            db1.close();
        } catch (Exception e3) {
        }
    }

    public static void c(Context context) {
        try {
            File f3 = new File(context.getFilesDir() + "/");
            if (f3.isDirectory()) {
                String[] s5 = f3.list();
                for (int i3 = 0; i3 < s5.length; i3++) {
                    new File(f3, s5[i3]).delete();
                }
            }
        } catch (Exception e4) {
            e4.printStackTrace();
        }
    }
}
