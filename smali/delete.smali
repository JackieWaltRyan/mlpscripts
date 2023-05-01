.class public Lcom/delete;
.super Ljava/lang/Object;
.source "delete.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static del(Landroid/content/Context;)V
    .registers 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 9
    :try_start_0
    new-instance v1, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 10
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_3b

    .line 11
    invoke-virtual {v1}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    .line 12
    .local v0, "children":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_27
    array-length v4, v0

    if-ge v3, v4, :cond_3b

    .line 13
    new-instance v4, Ljava/io/File;

    aget-object v5, v0, v3

    invoke-direct {v4, v1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->delete()Z
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_34} :catch_37

    .line 12
    add-int/lit8 v3, v3, 0x1

    goto :goto_27

    .line 16
    .end local v0    # "children":[Ljava/lang/String;
    .end local v1    # "dir":Ljava/io/File;
    .end local v3    # "i":I
    :catch_37
    move-exception v2

    .line 17
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 19
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_3b
    return-void
.end method
