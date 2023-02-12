.class public Lcom/start;
.super Ljava/lang/Object;
.source "start.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    new-instance v0, Lcom/start$1;

    invoke-direct {v0, p0}, Lcom/start$1;-><init>(Landroid/content/Context;)V

    .line 115
    .local v0, "r1":Ljava/lang/Runnable;
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 116
    .local v1, "t1":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 117
    return-void
.end method
