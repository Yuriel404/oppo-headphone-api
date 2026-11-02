.method static constructor <clinit>()V
    .registers 1

    .line 1
    const-string v0, "db764ac8-4b08-7f25-aafe-59d03c27bae3"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    .line 4
    .line 5
    .line 6
    const-string v0, "db764ac8-4b08-7f25-aafe-59d03c27bae4"

    .line 7
    .line 8
    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    .line 9
    .line 10
    .line 11
    const-string v0, "00001107-D102-11E1-9B23-00025B00A5A5"

    .line 12
    .line 13
    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, LH8/b;->A:Ljava/util/UUID;

    .line 18
    .line 19
    return-void
.end method
