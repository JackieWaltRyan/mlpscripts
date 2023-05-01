.class public Lcom/copy;
.super Ljava/lang/Object;
.source "copy.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cpl(Landroid/content/Context;)V
    .registers 24
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    :try_start_0
    const-string v13, "mlp_save_prime.dat"

    .line 14
    .local v13, "mlpSavePrime":Ljava/lang/String;
    new-instance v18, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v20

    const-string v21, "mlp_save_prime.dat"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 16
    .local v18, "saveFile":Ljava/io/File;
    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->exists()Z
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_14c

    move-result v20

    if-eqz v20, :cond_98

    .line 18
    :try_start_19
    new-instance v5, Ljava/io/File;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "/"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 19
    .local v5, "dir":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v21

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v22, v0

    const/16 v20, 0x0

    :goto_42
    move/from16 v0, v20

    move/from16 v1, v22

    if-ge v0, v1, :cond_54

    aget-object v8, v21, v20

    .line 20
    .local v8, "file":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->delete()Z
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_4d} :catch_50

    .line 19
    add-int/lit8 v20, v20, 0x1

    goto :goto_42

    .line 22
    .end local v5    # "dir":Ljava/io/File;
    .end local v8    # "file":Ljava/io/File;
    :catch_50
    move-exception v6

    .line 23
    .local v6, "e":Ljava/lang/Exception;
    :try_start_51
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_54} :catch_14c

    .line 27
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_54
    const/4 v11, 0x0

    .line 28
    .local v11, "in":Ljava/io/InputStream;
    const/4 v14, 0x0

    .line 29
    .local v14, "out":Ljava/io/OutputStream;
    :try_start_56
    new-instance v19, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v20

    const-string v21, "mlp_save_prime.dat"

    invoke-direct/range {v19 .. v21}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 30
    .local v19, "targetFile":Ljava/io/File;
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->mkdirs()Z

    .line 32
    new-instance v12, Ljava/io/FileInputStream;

    move-object/from16 v0, v18

    invoke-direct {v12, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_56 .. :try_end_6f} :catch_156

    .line 33
    .end local v11    # "in":Ljava/io/InputStream;
    .local v12, "in":Ljava/io/InputStream;
    :try_start_6f
    new-instance v15, Ljava/io/FileOutputStream;

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_76
    .catch Ljava/lang/Exception; {:try_start_6f .. :try_end_76} :catch_159

    .line 34
    .end local v14    # "out":Ljava/io/OutputStream;
    .local v15, "out":Ljava/io/OutputStream;
    const/16 v20, 0x400

    :try_start_78
    move/from16 v0, v20

    new-array v3, v0, [B

    .line 36
    .local v3, "buffer":[B
    :goto_7c
    invoke-virtual {v12, v3}, Ljava/io/InputStream;->read([B)I

    move-result v17

    .local v17, "read":I
    const/16 v20, -0x1

    move/from16 v0, v17

    move/from16 v1, v20

    if-eq v0, v1, :cond_e1

    .line 37
    const/16 v20, 0x0

    move/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v15, v3, v0, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_91
    .catch Ljava/lang/Exception; {:try_start_78 .. :try_end_91} :catch_92

    goto :goto_7c

    .line 42
    .end local v3    # "buffer":[B
    .end local v17    # "read":I
    :catch_92
    move-exception v6

    move-object v14, v15

    .end local v15    # "out":Ljava/io/OutputStream;
    .restart local v14    # "out":Ljava/io/OutputStream;
    move-object v11, v12

    .line 43
    .end local v12    # "in":Ljava/io/InputStream;
    .end local v19    # "targetFile":Ljava/io/File;
    .restart local v6    # "e":Ljava/lang/Exception;
    .restart local v11    # "in":Ljava/io/InputStream;
    :goto_95
    :try_start_95
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 47
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v11    # "in":Ljava/io/InputStream;
    .end local v14    # "out":Ljava/io/OutputStream;
    :cond_98
    :goto_98
    const-string v9, "gameloft_sharing"

    .line 48
    .local v9, "gameloftSharing":Ljava/lang/String;
    new-instance v10, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v20

    const-string v21, "gameloft_sharing"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v10, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 50
    .local v10, "gameloftSharingFile":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v20

    if-eqz v20, :cond_138

    .line 51
    new-instance v4, Ljava/io/File;

    const-string v20, "gameloft_sharing"

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_c8
    .catch Ljava/lang/Exception; {:try_start_95 .. :try_end_c8} :catch_14c

    .line 53
    .local v4, "databaseFolder":Ljava/io/File;
    :try_start_c8
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v21

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v22, v0

    const/16 v20, 0x0

    :goto_d3
    move/from16 v0, v20

    move/from16 v1, v22

    if-ge v0, v1, :cond_f8

    aget-object v7, v21, v20

    .line 54
    .local v7, "f":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->delete()Z
    :try_end_de
    .catch Ljava/lang/Exception; {:try_start_c8 .. :try_end_de} :catch_f4

    .line 53
    add-int/lit8 v20, v20, 0x1

    goto :goto_d3

    .line 39
    .end local v4    # "databaseFolder":Ljava/io/File;
    .end local v7    # "f":Ljava/io/File;
    .end local v9    # "gameloftSharing":Ljava/lang/String;
    .end local v10    # "gameloftSharingFile":Ljava/io/File;
    .restart local v3    # "buffer":[B
    .restart local v12    # "in":Ljava/io/InputStream;
    .restart local v15    # "out":Ljava/io/OutputStream;
    .restart local v17    # "read":I
    .restart local v19    # "targetFile":Ljava/io/File;
    :cond_e1
    :try_start_e1
    invoke-virtual {v15}, Ljava/io/OutputStream;->close()V

    .line 40
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V

    .line 41
    new-instance v20, Ljava/io/File;

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->delete()Z
    :try_end_f3
    .catch Ljava/lang/Exception; {:try_start_e1 .. :try_end_f3} :catch_92

    goto :goto_98

    .line 56
    .end local v3    # "buffer":[B
    .end local v12    # "in":Ljava/io/InputStream;
    .end local v15    # "out":Ljava/io/OutputStream;
    .end local v17    # "read":I
    .end local v19    # "targetFile":Ljava/io/File;
    .restart local v4    # "databaseFolder":Ljava/io/File;
    .restart local v9    # "gameloftSharing":Ljava/lang/String;
    .restart local v10    # "gameloftSharingFile":Ljava/io/File;
    :catch_f4
    move-exception v6

    .line 57
    .restart local v6    # "e":Ljava/lang/Exception;
    :try_start_f5
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_f8
    .catch Ljava/lang/Exception; {:try_start_f5 .. :try_end_f8} :catch_14c

    .line 61
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_f8
    const/4 v11, 0x0

    .line 62
    .restart local v11    # "in":Ljava/io/InputStream;
    const/4 v14, 0x0

    .line 63
    .restart local v14    # "out":Ljava/io/OutputStream;
    :try_start_fa
    new-instance v16, Ljava/io/File;

    const-string v20, "gameloft_sharing"

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-direct {v0, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 64
    .local v16, "outputFile":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->mkdirs()Z

    .line 65
    new-instance v12, Ljava/io/FileInputStream;

    invoke-direct {v12, v10}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_111
    .catch Ljava/lang/Exception; {:try_start_fa .. :try_end_111} :catch_151

    .line 66
    .end local v11    # "in":Ljava/io/InputStream;
    .restart local v12    # "in":Ljava/io/InputStream;
    :try_start_111
    new-instance v15, Ljava/io/FileOutputStream;

    invoke-direct/range {v15 .. v16}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_116
    .catch Ljava/lang/Exception; {:try_start_111 .. :try_end_116} :catch_153

    .line 67
    .end local v14    # "out":Ljava/io/OutputStream;
    .restart local v15    # "out":Ljava/io/OutputStream;
    const/16 v20, 0x400

    :try_start_118
    move/from16 v0, v20

    new-array v3, v0, [B

    .line 69
    .restart local v3    # "buffer":[B
    :goto_11c
    invoke-virtual {v12, v3}, Ljava/io/InputStream;->read([B)I

    move-result v17

    .restart local v17    # "read":I
    const/16 v20, -0x1

    move/from16 v0, v17

    move/from16 v1, v20

    if-eq v0, v1, :cond_139

    .line 70
    const/16 v20, 0x0

    move/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v15, v3, v0, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_131
    .catch Ljava/lang/Exception; {:try_start_118 .. :try_end_131} :catch_132

    goto :goto_11c

    .line 75
    .end local v3    # "buffer":[B
    .end local v17    # "read":I
    :catch_132
    move-exception v6

    move-object v14, v15

    .end local v15    # "out":Ljava/io/OutputStream;
    .restart local v14    # "out":Ljava/io/OutputStream;
    move-object v11, v12

    .line 76
    .end local v12    # "in":Ljava/io/InputStream;
    .end local v16    # "outputFile":Ljava/io/File;
    .restart local v6    # "e":Ljava/lang/Exception;
    .restart local v11    # "in":Ljava/io/InputStream;
    :goto_135
    :try_start_135
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_138
    .catch Ljava/lang/Exception; {:try_start_135 .. :try_end_138} :catch_14c

    .line 82
    .end local v4    # "databaseFolder":Ljava/io/File;
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v9    # "gameloftSharing":Ljava/lang/String;
    .end local v10    # "gameloftSharingFile":Ljava/io/File;
    .end local v11    # "in":Ljava/io/InputStream;
    .end local v13    # "mlpSavePrime":Ljava/lang/String;
    .end local v14    # "out":Ljava/io/OutputStream;
    .end local v18    # "saveFile":Ljava/io/File;
    :cond_138
    :goto_138
    return-void

    .line 72
    .restart local v3    # "buffer":[B
    .restart local v4    # "databaseFolder":Ljava/io/File;
    .restart local v9    # "gameloftSharing":Ljava/lang/String;
    .restart local v10    # "gameloftSharingFile":Ljava/io/File;
    .restart local v12    # "in":Ljava/io/InputStream;
    .restart local v13    # "mlpSavePrime":Ljava/lang/String;
    .restart local v15    # "out":Ljava/io/OutputStream;
    .restart local v16    # "outputFile":Ljava/io/File;
    .restart local v17    # "read":I
    .restart local v18    # "saveFile":Ljava/io/File;
    :cond_139
    :try_start_139
    invoke-virtual {v15}, Ljava/io/OutputStream;->close()V

    .line 73
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V

    .line 74
    new-instance v20, Ljava/io/File;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->delete()Z
    :try_end_14b
    .catch Ljava/lang/Exception; {:try_start_139 .. :try_end_14b} :catch_132

    goto :goto_138

    .line 79
    .end local v3    # "buffer":[B
    .end local v4    # "databaseFolder":Ljava/io/File;
    .end local v9    # "gameloftSharing":Ljava/lang/String;
    .end local v10    # "gameloftSharingFile":Ljava/io/File;
    .end local v12    # "in":Ljava/io/InputStream;
    .end local v13    # "mlpSavePrime":Ljava/lang/String;
    .end local v15    # "out":Ljava/io/OutputStream;
    .end local v16    # "outputFile":Ljava/io/File;
    .end local v17    # "read":I
    .end local v18    # "saveFile":Ljava/io/File;
    :catch_14c
    move-exception v6

    .line 80
    .restart local v6    # "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_138

    .line 75
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v4    # "databaseFolder":Ljava/io/File;
    .restart local v9    # "gameloftSharing":Ljava/lang/String;
    .restart local v10    # "gameloftSharingFile":Ljava/io/File;
    .restart local v11    # "in":Ljava/io/InputStream;
    .restart local v13    # "mlpSavePrime":Ljava/lang/String;
    .restart local v14    # "out":Ljava/io/OutputStream;
    .restart local v18    # "saveFile":Ljava/io/File;
    :catch_151
    move-exception v6

    goto :goto_135

    .end local v11    # "in":Ljava/io/InputStream;
    .restart local v12    # "in":Ljava/io/InputStream;
    .restart local v16    # "outputFile":Ljava/io/File;
    :catch_153
    move-exception v6

    move-object v11, v12

    .end local v12    # "in":Ljava/io/InputStream;
    .restart local v11    # "in":Ljava/io/InputStream;
    goto :goto_135

    .line 42
    .end local v4    # "databaseFolder":Ljava/io/File;
    .end local v9    # "gameloftSharing":Ljava/lang/String;
    .end local v10    # "gameloftSharingFile":Ljava/io/File;
    .end local v16    # "outputFile":Ljava/io/File;
    :catch_156
    move-exception v6

    goto/16 :goto_95

    .end local v11    # "in":Ljava/io/InputStream;
    .restart local v12    # "in":Ljava/io/InputStream;
    .restart local v19    # "targetFile":Ljava/io/File;
    :catch_159
    move-exception v6

    move-object v11, v12

    .end local v12    # "in":Ljava/io/InputStream;
    .restart local v11    # "in":Ljava/io/InputStream;
    goto/16 :goto_95
.end method
