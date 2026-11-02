.method public final m0(Ljava/lang/String;Lw8/a;)V
    .registers 37

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    const/16 v11, 0x12

    .line 8
    .line 9
    const/16 v12, 0x1b

    .line 10
    .line 11
    const/16 v16, 0x8

    .line 12
    .line 13
    const/4 v13, 0x5

    .line 14
    const/16 v17, 0xb

    .line 15
    .line 16
    const/16 v18, 0xd

    .line 17
    .line 18
    const/4 v4, 0x4

    .line 19
    const/16 v20, 0xa

    .line 20
    .line 21
    const/4 v7, 0x3

    .line 22
    const/16 v21, 0x18

    .line 23
    .line 24
    const/4 v15, 0x2

    .line 25
    const/4 v5, 0x0

    .line 26
    const/4 v6, 0x1

    .line 27
    if-nez v3, :cond_1e

    .line 28
    .line 29
    goto/16 :goto_92

    .line 30
    .line 31
    :cond_1e
    iget v9, v3, Lw8/a;->a:I

    .line 32
    .line 33
    invoke-static {v9}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    const v0, 0x8205

    .line 37
    .line 38
    .line 39
    const-string v14, "HeadsetCoreService"

    .line 40
    .line 41
    if-eq v9, v0, :cond_47

    .line 42
    .line 43
    const v0, 0x812f

    .line 44
    .line 45
    .line 46
    if-eq v9, v0, :cond_47

    .line 47
    .line 48
    :try_start_2f
    iget-object v0, v1, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->mPlugins:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v8, LYa/l;

    .line 55
    .line 56
    invoke-direct {v8, v2, v3}, LYa/l;-><init>(Ljava/lang/String;Lw8/a;)V

    .line 57
    .line 58
    .line 59
    invoke-interface {v0, v8}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 60
    .line 61
    .line 62
    move-result v0
    :try_end_3e
    .catchall {:try_start_2f .. :try_end_3e} :catchall_41

    .line 63
    if-eqz v0, :cond_47

    .line 64
    .line 65
    goto :goto_92

    .line 66
    :catchall_41
    move-exception v0

    .line 67
    const-string v8, "handleRecvPacket, error: "

    .line 68
    .line 69
    invoke-static {v14, v8, v0}, LQ8/a;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    :cond_47
    sget-object v0, Li8/a;->a:[[I

    .line 73
    .line 74
    and-int/lit16 v0, v9, 0x7f00

    .line 75
    .line 76
    const/16 v8, 0x100

    .line 77
    .line 78
    if-eq v0, v8, :cond_df6

    .line 79
    .line 80
    const/16 v8, 0x200

    .line 81
    .line 82
    if-eq v0, v8, :cond_df0

    .line 83
    .line 84
    const/16 v8, 0x300

    .line 85
    .line 86
    if-eq v0, v8, :cond_daa

    .line 87
    .line 88
    const/16 v8, 0x400

    .line 89
    .line 90
    if-eq v0, v8, :cond_a57

    .line 91
    .line 92
    const/16 v8, 0x500

    .line 93
    .line 94
    if-eq v0, v8, :cond_2a8

    .line 95
    .line 96
    const/16 v7, 0xf00

    .line 97
    .line 98
    if-eq v0, v7, :cond_a5

    .line 99
    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v4, "Receive an unrecognized packet.  key=0x"

    .line 103
    .line 104
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v3}, Lw8/a;->a()I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v4, ", from "

    .line 119
    .line 120
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    sget-object v4, LQ8/a;->a:Lcom/oplus/melody/common/util/y$a;

    .line 124
    .line 125
    invoke-static {v2}, Lcom/oplus/melody/common/util/y;->r(Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget v0, v3, Lw8/a;->a:I

    .line 140
    .line 141
    const v4, 0x8000

    .line 142
    .line 143
    .line 144
    and-int/2addr v0, v4

    .line 145
    if-eqz v0, :cond_93

    .line 146
    .line 147
    :goto_92
    return-void

    .line 148
    :cond_93
    new-array v0, v6, [B

    .line 149
    .line 150
    aput-byte v6, v0, v5

    .line 151
    .line 152
    iget-object v4, v1, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->mPacketFactory:Lw8/b;

    .line 153
    .line 154
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 155
    .line 156
    .line 157
    invoke-static {v3, v0}, Lw8/b;->b(Lw8/a;[B)Lw8/a;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {v1, v2, v0}, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->z0(Ljava/lang/String;Lw8/a;)Z

    .line 162
    .line 163
    .line 164
    goto/16 :goto_dfb

    .line 165
    .line 166
    :cond_a5
    iget-object v0, v1, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->mDebugCommandManager:Lt8/a;

    .line 167
    .line 168
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 169
    .line 170
    .line 171
    const-string v7, "DebugCommandManager"

    .line 172
    .line 173
    if-eqz v2, :cond_2a1

    .line 174
    .line 175
    iget-object v8, v0, Lt8/a;->c:Landroid/os/Handler;

    .line 176
    .line 177
    iget v10, v3, Lw8/a;->a:I

    .line 178
    .line 179
    iget-object v11, v3, Lw8/a;->d:[B

    .line 180
    .line 181
    sparse-switch v10, :sswitch_data_e06

    .line 182
    .line 183
    .line 184
    goto/16 :goto_dfb

    .line 185
    .line 186
    :sswitch_b9
    array-length v0, v11

    .line 187
    if-nez v0, :cond_c3

    .line 188
    .line 189
    const-string v0, "CMD_SET_DEBUG_FEATURE_RSP Invalid data length when response."

    .line 190
    .line 191
    invoke-static {v7, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    goto/16 :goto_dfb

    .line 195
    .line 196
    :cond_c3
    aget-byte v0, v11, v5

    .line 197
    .line 198
    new-instance v4, Lcom/oplus/melody/btsdk/protocol/commands/x;

    .line 199
    .line 200
    const/16 v5, 0x14

    .line 201
    .line 202
    invoke-direct {v4, v0, v5}, Lcom/oplus/melody/btsdk/protocol/commands/x;-><init>(II)V

    .line 203
    .line 204
    .line 205
    invoke-static {v7, v4}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 206
    .line 207
    .line 208
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/SetCommandStateInfo;

    .line 209
    .line 210
    invoke-direct {v4}, Lcom/oplus/melody/btsdk/api/data/SetCommandStateInfo;-><init>()V

    .line 211
    .line 212
    .line 213
    iput-object v2, v4, Lcom/oplus/melody/btsdk/api/data/SetCommandStateInfo;->mAddress:Ljava/lang/String;

    .line 214
    .line 215
    iput v0, v4, Lcom/oplus/melody/btsdk/api/data/SetCommandStateInfo;->mSetStatus:I

    .line 216
    .line 217
    iput v10, v4, Lcom/oplus/melody/btsdk/api/data/SetCommandStateInfo;->mResponseCommand:I

    .line 218
    .line 219
    array-length v0, v11

    .line 220
    if-le v0, v6, :cond_e1

    .line 221
    .line 222
    aget-byte v0, v11, v6

    .line 223
    .line 224
    iput v0, v4, Lcom/oplus/melody/btsdk/api/data/SetCommandStateInfo;->mRspValue:I

    .line 225
    .line 226
    :cond_e1
    new-instance v0, Lcom/oplus/melody/btsdk/api/data/BluetoothReceiveData;

    .line 227
    .line 228
    const/high16 v5, 0x100000

    .line 229
    .line 230
    invoke-direct {v0, v5, v4}, Lcom/oplus/melody/btsdk/api/data/BluetoothReceiveData;-><init>(ILandroid/os/Parcelable;)V

    .line 231
    .line 232
    .line 233
    sget-object v4, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService$d;->a:Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;

    .line 234
    .line 235
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 236
    .line 237
    .line 238
    invoke-static {v0}, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->p0(Lcom/oplus/melody/btsdk/api/data/BluetoothReceiveData;)V

    .line 239
    .line 240
    .line 241
    goto/16 :goto_dfb

    .line 242
    .line 243
    :sswitch_f2
    invoke-static {v11}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    if-eqz v0, :cond_113

    .line 248
    .line 249
    new-instance v4, Ljava/lang/StringBuilder;

    .line 250
    .line 251
    const-string v5, "handleRecvDiagnosticResult error. status: "

    .line 252
    .line 253
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    const-string v0, ", "

    .line 260
    .line 261
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-static {v7, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    goto/16 :goto_dfb

    .line 275
    .line 276
    :cond_113
    array-length v0, v11

    .line 277
    if-gt v0, v6, :cond_11d

    .line 278
    .line 279
    const-string v0, "handleRecvDiagnosticResult, The length is invalid when receive diagnostic."

    .line 280
    .line 281
    invoke-static {v7, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    goto/16 :goto_dfb

    .line 285
    .line 286
    :cond_11d
    new-instance v0, Ljava/lang/String;

    .line 287
    .line 288
    array-length v4, v11

    .line 289
    sub-int/2addr v4, v6

    .line 290
    sget-object v10, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 291
    .line 292
    invoke-direct {v0, v11, v6, v4, v10}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 293
    .line 294
    .line 295
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/DiagnosisJsonDataInfo;

    .line 296
    .line 297
    invoke-direct {v4}, Lcom/oplus/melody/btsdk/api/data/DiagnosisJsonDataInfo;-><init>()V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v4, v2}, Lcom/oplus/melody/btsdk/api/data/DiagnosisJsonDataInfo;->setAddress(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v4, v0}, Lcom/oplus/melody/btsdk/api/data/DiagnosisJsonDataInfo;->setJsonData(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    const-string v6, "handleRecvDiagnosticResult, jsonData: "

    .line 307
    .line 308
    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    invoke-static {v7, v0}, LQ8/a;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    const/16 v0, 0x32

    .line 316
    .line 317
    invoke-virtual {v8, v0, v5, v5, v4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 322
    .line 323
    .line 324
    goto/16 :goto_dfb

    .line 325
    .line 326
    :sswitch_145
    array-length v10, v11

    .line 327
    if-gtz v10, :cond_155

    .line 328
    .line 329
    new-instance v0, Ljava/lang/StringBuilder;

    .line 330
    .line 331
    const-string v4, "handleRecvSwitchDebug, Length invalid or debug off when receive debug switch. len: "

    .line 332
    .line 333
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 334
    .line 335
    .line 336
    array-length v4, v11

    .line 337
    invoke-static {v0, v4, v7}, Lg0/c;->d(Ljava/lang/StringBuilder;ILjava/lang/String;)V

    .line 338
    .line 339
    .line 340
    goto/16 :goto_dfb

    .line 341
    .line 342
    :cond_155
    invoke-static {v11}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 343
    .line 344
    .line 345
    move-result v10

    .line 346
    new-instance v14, Lcom/oplus/melody/btsdk/api/data/DebugDataInfo;

    .line 347
    .line 348
    invoke-direct {v14}, Lcom/oplus/melody/btsdk/api/data/DebugDataInfo;-><init>()V

    .line 349
    .line 350
    .line 351
    invoke-virtual {v14, v10}, Lcom/oplus/melody/btsdk/api/data/DebugDataInfo;->setStatus(I)V

    .line 352
    .line 353
    .line 354
    array-length v10, v11

    .line 355
    if-lt v10, v13, :cond_16d

    .line 356
    .line 357
    invoke-static {v11, v6, v4, v6}, Ln7/d;->d([BIIZ)I

    .line 358
    .line 359
    .line 360
    move-result v4

    .line 361
    invoke-virtual {v14, v4}, Lcom/oplus/melody/btsdk/api/data/DebugDataInfo;->setDataLength(I)V

    .line 362
    .line 363
    .line 364
    iput v4, v0, Lt8/a;->g:I

    .line 365
    .line 366
    :cond_16d
    new-instance v4, Ldd/l;

    .line 367
    .line 368
    invoke-direct {v4, v14, v12}, Ldd/l;-><init>(Ljava/lang/Object;I)V

    .line 369
    .line 370
    .line 371
    invoke-static {v7, v4}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 372
    .line 373
    .line 374
    const/16 v4, 0x29

    .line 375
    .line 376
    invoke-virtual {v8, v4, v5, v5, v14}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 377
    .line 378
    .line 379
    move-result-object v4

    .line 380
    invoke-virtual {v4}, Landroid/os/Message;->sendToTarget()V

    .line 381
    .line 382
    .line 383
    iput v5, v0, Lt8/a;->e:I

    .line 384
    .line 385
    iput v5, v0, Lt8/a;->f:I

    .line 386
    .line 387
    goto/16 :goto_dfb

    .line 388
    .line 389
    :sswitch_184
    array-length v0, v11

    .line 390
    if-ge v0, v15, :cond_18e

    .line 391
    .line 392
    const-string v0, "handleRecvDebugFeatureInfo, The length of data is not valid."

    .line 393
    .line 394
    invoke-static {v7, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 395
    .line 396
    .line 397
    goto/16 :goto_dfb

    .line 398
    .line 399
    :cond_18e
    aget-byte v0, v11, v5

    .line 400
    .line 401
    and-int/lit16 v0, v0, 0xff

    .line 402
    .line 403
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/DebugFeatureInfo;

    .line 404
    .line 405
    invoke-direct {v4}, Lcom/oplus/melody/btsdk/api/data/DebugFeatureInfo;-><init>()V

    .line 406
    .line 407
    .line 408
    invoke-virtual {v4, v2}, Lcom/oplus/melody/btsdk/api/data/DebugFeatureInfo;->setAddress(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    invoke-virtual {v4, v0}, Lcom/oplus/melody/btsdk/api/data/DebugFeatureInfo;->setType(I)V

    .line 412
    .line 413
    .line 414
    aget-byte v0, v11, v6

    .line 415
    .line 416
    and-int/lit16 v0, v0, 0xff

    .line 417
    .line 418
    array-length v10, v11

    .line 419
    mul-int/lit8 v12, v0, 0x2

    .line 420
    .line 421
    add-int/2addr v12, v15

    .line 422
    if-lt v10, v12, :cond_1d6

    .line 423
    .line 424
    if-nez v0, :cond_1aa

    .line 425
    .line 426
    goto :goto_1d6

    .line 427
    :cond_1aa
    new-instance v10, Ljava/util/ArrayList;

    .line 428
    .line 429
    invoke-direct {v10, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 430
    .line 431
    .line 432
    move v12, v5

    .line 433
    move v13, v15

    .line 434
    :goto_1b1
    if-ge v12, v0, :cond_1be

    .line 435
    .line 436
    new-instance v14, Lcom/oplus/melody/btsdk/api/data/DebugModuleInfo;

    .line 437
    .line 438
    invoke-direct {v14, v13, v11}, Lcom/oplus/melody/btsdk/api/data/DebugModuleInfo;-><init>(I[B)V

    .line 439
    .line 440
    .line 441
    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 442
    .line 443
    .line 444
    add-int/2addr v13, v15

    .line 445
    add-int/2addr v12, v6

    .line 446
    goto :goto_1b1

    .line 447
    :cond_1be
    invoke-virtual {v4, v10}, Lcom/oplus/melody/btsdk/api/data/DebugFeatureInfo;->setDebugModuleList(Ljava/util/List;)V

    .line 448
    .line 449
    .line 450
    new-instance v0, Lha/b;

    .line 451
    .line 452
    const/16 v6, 0xf

    .line 453
    .line 454
    invoke-direct {v0, v4, v6}, Lha/b;-><init>(Ljava/lang/Object;I)V

    .line 455
    .line 456
    .line 457
    invoke-static {v7, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 458
    .line 459
    .line 460
    const/16 v0, 0x47

    .line 461
    .line 462
    invoke-virtual {v8, v0, v5, v5, v4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 463
    .line 464
    .line 465
    move-result-object v0

    .line 466
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 467
    .line 468
    .line 469
    goto/16 :goto_dfb

    .line 470
    .line 471
    :cond_1d6
    :goto_1d6
    const-string v4, "handleRecvDebugFeatureInfo length not valid. number: "

    .line 472
    .line 473
    const-string v5, ", length: "

    .line 474
    .line 475
    invoke-static {v0, v4, v5}, LAb/A0;->k(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    move-result-object v0

    .line 479
    array-length v4, v11

    .line 480
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 481
    .line 482
    .line 483
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 484
    .line 485
    .line 486
    move-result-object v0

    .line 487
    invoke-static {v7, v0}, LQ8/a;->m(Ljava/lang/String;Ljava/lang/String;)V

    .line 488
    .line 489
    .line 490
    goto/16 :goto_dfb

    .line 491
    .line 492
    :sswitch_1eb
    array-length v4, v11

    .line 493
    if-gtz v4, :cond_1f5

    .line 494
    .line 495
    const-string v0, "handleRecvDebugStop, The length is invalid when receive debug stop."

    .line 496
    .line 497
    invoke-static {v7, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 498
    .line 499
    .line 500
    goto/16 :goto_dfb

    .line 501
    .line 502
    :cond_1f5
    aget-byte v4, v11, v5

    .line 503
    .line 504
    if-eq v4, v6, :cond_200

    .line 505
    .line 506
    const-string v0, "handleRecvDebugStop, type is not 1 or buffer is empty."

    .line 507
    .line 508
    invoke-static {v7, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 509
    .line 510
    .line 511
    goto/16 :goto_dfb

    .line 512
    .line 513
    :cond_200
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/DebugDataInfo;

    .line 514
    .line 515
    invoke-direct {v4}, Lcom/oplus/melody/btsdk/api/data/DebugDataInfo;-><init>()V

    .line 516
    .line 517
    .line 518
    new-instance v6, Ldd/h;

    .line 519
    .line 520
    const/16 v10, 0x1a

    .line 521
    .line 522
    invoke-direct {v6, v0, v10}, Ldd/h;-><init>(Ljava/lang/Object;I)V

    .line 523
    .line 524
    .line 525
    invoke-static {v7, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 526
    .line 527
    .line 528
    const/16 v6, 0x2b

    .line 529
    .line 530
    invoke-virtual {v8, v6, v5, v5, v4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 531
    .line 532
    .line 533
    move-result-object v4

    .line 534
    invoke-virtual {v4}, Landroid/os/Message;->sendToTarget()V

    .line 535
    .line 536
    .line 537
    iput v5, v0, Lt8/a;->e:I

    .line 538
    .line 539
    iput v5, v0, Lt8/a;->f:I

    .line 540
    .line 541
    goto/16 :goto_dfb

    .line 542
    .line 543
    :sswitch_21e
    array-length v4, v11

    .line 544
    if-gtz v4, :cond_228

    .line 545
    .line 546
    const-string v0, "handleRecvDebugData, The length is invalid when receive debug data."

    .line 547
    .line 548
    invoke-static {v7, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 549
    .line 550
    .line 551
    goto/16 :goto_dfb

    .line 552
    .line 553
    :cond_228
    invoke-static {v11}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 554
    .line 555
    .line 556
    move-result-object v4

    .line 557
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    .line 558
    .line 559
    .line 560
    move-result v10

    .line 561
    array-length v11, v11

    .line 562
    sub-int/2addr v11, v6

    .line 563
    new-array v12, v11, [B

    .line 564
    .line 565
    invoke-virtual {v4, v12}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 566
    .line 567
    .line 568
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/DebugDataInfo;

    .line 569
    .line 570
    invoke-direct {v4}, Lcom/oplus/melody/btsdk/api/data/DebugDataInfo;-><init>()V

    .line 571
    .line 572
    .line 573
    invoke-virtual {v4, v10}, Lcom/oplus/melody/btsdk/api/data/DebugDataInfo;->setType(I)V

    .line 574
    .line 575
    .line 576
    invoke-virtual {v4, v11}, Lcom/oplus/melody/btsdk/api/data/DebugDataInfo;->setDataLength(I)V

    .line 577
    .line 578
    .line 579
    invoke-virtual {v4, v12}, Lcom/oplus/melody/btsdk/api/data/DebugDataInfo;->setData([B)V

    .line 580
    .line 581
    .line 582
    const/16 v10, 0x2a

    .line 583
    .line 584
    invoke-virtual {v8, v10, v5, v5, v4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 585
    .line 586
    .line 587
    move-result-object v4

    .line 588
    invoke-virtual {v4}, Landroid/os/Message;->sendToTarget()V

    .line 589
    .line 590
    .line 591
    iget v4, v0, Lt8/a;->e:I

    .line 592
    .line 593
    add-int/2addr v4, v11

    .line 594
    iput v4, v0, Lt8/a;->e:I

    .line 595
    .line 596
    iget v8, v0, Lt8/a;->f:I

    .line 597
    .line 598
    add-int/2addr v8, v11

    .line 599
    iput v8, v0, Lt8/a;->f:I

    .line 600
    .line 601
    const/16 v8, 0x2000

    .line 602
    .line 603
    if-lt v4, v8, :cond_dfb

    .line 604
    .line 605
    new-array v4, v6, [B

    .line 606
    .line 607
    aput-byte v5, v4, v5

    .line 608
    .line 609
    iget-object v6, v0, Lt8/a;->a:Lw8/b;

    .line 610
    .line 611
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 612
    .line 613
    .line 614
    invoke-static {v3, v4}, Lw8/b;->b(Lw8/a;[B)Lw8/a;

    .line 615
    .line 616
    .line 617
    move-result-object v4

    .line 618
    iget-object v6, v0, Lt8/a;->b:Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;

    .line 619
    .line 620
    invoke-virtual {v6, v2, v4}, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->z0(Ljava/lang/String;Lw8/a;)Z

    .line 621
    .line 622
    .line 623
    new-instance v4, Ljava/lang/StringBuilder;

    .line 624
    .line 625
    const-string v6, "handleRecvDebugData, response packet ok, pkgLen: "

    .line 626
    .line 627
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 628
    .line 629
    .line 630
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 631
    .line 632
    .line 633
    const-string v6, ", curLen: "

    .line 634
    .line 635
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 636
    .line 637
    .line 638
    iget v6, v0, Lt8/a;->e:I

    .line 639
    .line 640
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 641
    .line 642
    .line 643
    const-string v6, ", curTotalLen: "

    .line 644
    .line 645
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 646
    .line 647
    .line 648
    iget v6, v0, Lt8/a;->f:I

    .line 649
    .line 650
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 651
    .line 652
    .line 653
    const-string v6, ", totalLen: "

    .line 654
    .line 655
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 656
    .line 657
    .line 658
    iget v6, v0, Lt8/a;->g:I

    .line 659
    .line 660
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 661
    .line 662
    .line 663
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 664
    .line 665
    .line 666
    move-result-object v4

    .line 667
    invoke-static {v7, v4}, LQ8/a;->m(Ljava/lang/String;Ljava/lang/String;)V

    .line 668
    .line 669
    .line 670
    iput v5, v0, Lt8/a;->e:I

    .line 671
    .line 672
    goto/16 :goto_dfb

    .line 673
    .line 674
    :cond_2a1
    const-string v0, "receive params is null, return!"

    .line 675
    .line 676
    invoke-static {v7, v0, v2}, LQ8/a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 677
    .line 678
    .line 679
    goto/16 :goto_dfb

    .line 680
    .line 681
    :cond_2a8
    iget-object v8, v1, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->mRequestCommandManager:Lcom/oplus/melody/btsdk/protocol/commands/r;

    .line 682
    .line 683
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 684
    .line 685
    .line 686
    const-string v0, "parseSendAccountKey accountKey  offset:2 len:"

    .line 687
    .line 688
    const-string v14, "RequestCommandManager"

    .line 689
    .line 690
    if-eqz v2, :cond_a50

    .line 691
    .line 692
    sget-object v19, LQ8/a;->a:Lcom/oplus/melody/common/util/y$a;

    .line 693
    .line 694
    invoke-static {}, Lcom/oplus/melody/common/util/y;->l()Z

    .line 695
    .line 696
    .line 697
    move-result v19

    .line 698
    if-eqz v19, :cond_2d7

    .line 699
    .line 700
    new-instance v10, Ljava/lang/StringBuilder;

    .line 701
    .line 702
    move/from16 v28, v15

    .line 703
    .line 704
    const-string v15, "onReceivePacket key="

    .line 705
    .line 706
    invoke-direct {v10, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 707
    .line 708
    .line 709
    invoke-virtual {v3}, Lw8/a;->a()I

    .line 710
    .line 711
    .line 712
    move-result v15

    .line 713
    invoke-static {v15}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 714
    .line 715
    .line 716
    move-result-object v15

    .line 717
    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 718
    .line 719
    .line 720
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 721
    .line 722
    .line 723
    move-result-object v10

    .line 724
    invoke-static {v14, v10}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 725
    .line 726
    .line 727
    goto :goto_2d9

    .line 728
    :cond_2d7
    move/from16 v28, v15

    .line 729
    .line 730
    :goto_2d9
    iget v10, v3, Lw8/a;->a:I

    .line 731
    .line 732
    const-string v15, "CommandUtil"

    .line 733
    .line 734
    packed-switch v10, :pswitch_data_e20

    .line 735
    .line 736
    .line 737
    :pswitch_2e0
    goto/16 :goto_dfb

    .line 738
    .line 739
    :pswitch_2e2
    iget-object v0, v3, Lw8/a;->d:[B

    .line 740
    .line 741
    if-eqz v0, :cond_30f

    .line 742
    .line 743
    array-length v4, v0

    .line 744
    if-ge v4, v6, :cond_2ea

    .line 745
    .line 746
    goto :goto_30f

    .line 747
    :cond_2ea
    aget-byte v0, v0, v5

    .line 748
    .line 749
    new-instance v4, Lcom/oplus/melody/btsdk/protocol/commands/j;

    .line 750
    .line 751
    invoke-direct {v4, v0, v7}, Lcom/oplus/melody/btsdk/protocol/commands/j;-><init>(II)V

    .line 752
    .line 753
    .line 754
    invoke-static {v14, v4}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 755
    .line 756
    .line 757
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 758
    .line 759
    invoke-virtual {v4, v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 760
    .line 761
    .line 762
    new-instance v4, Landroid/util/Pair;

    .line 763
    .line 764
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 765
    .line 766
    .line 767
    move-result-object v0

    .line 768
    invoke-direct {v4, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 769
    .line 770
    .line 771
    iget-object v0, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 772
    .line 773
    const/16 v5, 0x5e

    .line 774
    .line 775
    invoke-virtual {v0, v5, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 776
    .line 777
    .line 778
    move-result-object v0

    .line 779
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 780
    .line 781
    .line 782
    goto/16 :goto_dfb

    .line 783
    .line 784
    :cond_30f
    :goto_30f
    const-string v0, "onRequestPhoneSpatialMode invalid data"

    .line 785
    .line 786
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 787
    .line 788
    .line 789
    iget-object v0, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->b:Lw8/b;

    .line 790
    .line 791
    new-array v4, v6, [B

    .line 792
    .line 793
    aput-byte v6, v4, v5

    .line 794
    .line 795
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 796
    .line 797
    .line 798
    invoke-static {v3, v4}, Lw8/b;->b(Lw8/a;[B)Lw8/a;

    .line 799
    .line 800
    .line 801
    move-result-object v0

    .line 802
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->c:Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;

    .line 803
    .line 804
    invoke-virtual {v4, v2, v0}, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->z0(Ljava/lang/String;Lw8/a;)Z

    .line 805
    .line 806
    .line 807
    goto/16 :goto_dfb

    .line 808
    .line 809
    :pswitch_328
    const-string v0, "onGetAppCapabilities"

    .line 810
    .line 811
    invoke-static {v14, v0, v2}, LQ8/a;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 812
    .line 813
    .line 814
    sget-object v0, Lp8/a$a;->a:Lp8/a;

    .line 815
    .line 816
    invoke-virtual {v0, v2}, Lp8/a;->a(Ljava/lang/String;)Lcom/oplus/melody/common/data/WhitelistConfigDTO;

    .line 817
    .line 818
    .line 819
    move-result-object v0

    .line 820
    if-eqz v0, :cond_350

    .line 821
    .line 822
    invoke-virtual {v0}, Lcom/oplus/melody/common/data/WhitelistConfigDTO;->getFunction()Lcom/oplus/melody/common/data/WhitelistConfigDTO$Function;

    .line 823
    .line 824
    .line 825
    move-result-object v4

    .line 826
    if-eqz v4, :cond_350

    .line 827
    .line 828
    invoke-virtual {v0}, Lcom/oplus/melody/common/data/WhitelistConfigDTO;->getFunction()Lcom/oplus/melody/common/data/WhitelistConfigDTO$Function;

    .line 829
    .line 830
    .line 831
    move-result-object v0

    .line 832
    invoke-virtual {v0}, Lcom/oplus/melody/common/data/WhitelistConfigDTO$Function;->getFastDiscovery()I

    .line 833
    .line 834
    .line 835
    move-result v0

    .line 836
    and-int/2addr v0, v6

    .line 837
    if-eqz v0, :cond_350

    .line 838
    .line 839
    sget-object v0, Lcom/oplus/melody/common/util/k;->a:Lcom/heytap/headset/HeyMelodyApplication;

    .line 840
    .line 841
    invoke-static {v0}, Lcom/oplus/melody/common/util/S;->v(Landroid/content/Context;)Z

    .line 842
    .line 843
    .line 844
    move-result v0

    .line 845
    if-eqz v0, :cond_350

    .line 846
    .line 847
    move v0, v6

    .line 848
    goto :goto_351

    .line 849
    :cond_350
    move v0, v5

    .line 850
    :goto_351
    and-int/lit16 v0, v0, 0xff

    .line 851
    .line 852
    int-to-byte v0, v0

    .line 853
    int-to-byte v4, v5

    .line 854
    new-array v7, v7, [B

    .line 855
    .line 856
    aput-byte v5, v7, v5

    .line 857
    .line 858
    aput-byte v0, v7, v6

    .line 859
    .line 860
    aput-byte v4, v7, v28

    .line 861
    .line 862
    iget-object v0, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->c:Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;

    .line 863
    .line 864
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->b:Lw8/b;

    .line 865
    .line 866
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 867
    .line 868
    .line 869
    invoke-static {v3, v7}, Lw8/b;->b(Lw8/a;[B)Lw8/a;

    .line 870
    .line 871
    .line 872
    move-result-object v4

    .line 873
    invoke-virtual {v0, v2, v4}, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->z0(Ljava/lang/String;Lw8/a;)Z

    .line 874
    .line 875
    .line 876
    goto/16 :goto_dfb

    .line 877
    .line 878
    :pswitch_36d
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 879
    .line 880
    .line 881
    move-result v0

    .line 882
    if-eqz v0, :cond_37a

    .line 883
    .line 884
    const-string v0, "onReceiveOneshotExeResultInfo, address is empty!"

    .line 885
    .line 886
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 887
    .line 888
    .line 889
    goto/16 :goto_dfb

    .line 890
    .line 891
    :cond_37a
    iget-object v0, v3, Lw8/a;->d:[B

    .line 892
    .line 893
    if-eqz v0, :cond_3a6

    .line 894
    .line 895
    array-length v4, v0

    .line 896
    if-ge v4, v6, :cond_382

    .line 897
    .line 898
    goto :goto_3a6

    .line 899
    :cond_382
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/OneshotExeResultInfo;

    .line 900
    .line 901
    invoke-direct {v4}, Lcom/oplus/melody/btsdk/api/data/OneshotExeResultInfo;-><init>()V

    .line 902
    .line 903
    .line 904
    invoke-virtual {v4, v2, v0, v5}, Lcom/oplus/melody/btsdk/api/data/OneshotExeResultInfo;->initData(Ljava/lang/String;[BI)Z

    .line 905
    .line 906
    .line 907
    move-result v0

    .line 908
    if-eqz v0, :cond_39f

    .line 909
    .line 910
    new-instance v0, Landroid/util/Pair;

    .line 911
    .line 912
    invoke-direct {v0, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 913
    .line 914
    .line 915
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 916
    .line 917
    const/16 v5, 0x57

    .line 918
    .line 919
    invoke-virtual {v4, v5, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 920
    .line 921
    .line 922
    move-result-object v0

    .line 923
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 924
    .line 925
    .line 926
    goto/16 :goto_dfb

    .line 927
    .line 928
    :cond_39f
    const-string v0, "onReceiveOneshotExeResultInfo, initData failed!"

    .line 929
    .line 930
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 931
    .line 932
    .line 933
    goto/16 :goto_dfb

    .line 934
    .line 935
    :cond_3a6
    :goto_3a6
    const-string v0, "onReceiveOneshotExeResultInfo, data is empty!"

    .line 936
    .line 937
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 938
    .line 939
    .line 940
    goto/16 :goto_dfb

    .line 941
    .line 942
    :pswitch_3ad
    new-instance v0, LBc/i;

    .line 943
    .line 944
    invoke-direct {v0, v2, v11}, LBc/i;-><init>(Ljava/lang/String;I)V

    .line 945
    .line 946
    .line 947
    invoke-static {v14, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 948
    .line 949
    .line 950
    const/16 v0, 0x54

    .line 951
    .line 952
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 953
    .line 954
    invoke-virtual {v4, v0, v5, v5, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 955
    .line 956
    .line 957
    move-result-object v0

    .line 958
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 959
    .line 960
    .line 961
    goto/16 :goto_dfb

    .line 962
    .line 963
    :pswitch_3c2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 964
    .line 965
    .line 966
    move-result v0

    .line 967
    if-eqz v0, :cond_3cf

    .line 968
    .line 969
    const-string v0, "onReceiveOneshotEncodeState, address is empty!"

    .line 970
    .line 971
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 972
    .line 973
    .line 974
    goto/16 :goto_dfb

    .line 975
    .line 976
    :cond_3cf
    iget-object v0, v3, Lw8/a;->d:[B

    .line 977
    .line 978
    if-eqz v0, :cond_3fd

    .line 979
    .line 980
    array-length v4, v0

    .line 981
    if-ge v4, v6, :cond_3d7

    .line 982
    .line 983
    goto :goto_3fd

    .line 984
    :cond_3d7
    aget-byte v0, v0, v5

    .line 985
    .line 986
    new-instance v4, LA9/l;

    .line 987
    .line 988
    const/16 v5, 0x17

    .line 989
    .line 990
    invoke-direct {v4, v0, v5}, LA9/l;-><init>(II)V

    .line 991
    .line 992
    .line 993
    invoke-static {v14, v4}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 994
    .line 995
    .line 996
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/OneshotEncodeState;

    .line 997
    .line 998
    invoke-direct {v4}, Lcom/oplus/melody/btsdk/api/data/OneshotEncodeState;-><init>()V

    .line 999
    .line 1000
    .line 1001
    invoke-virtual {v4, v2, v0}, Lcom/oplus/melody/btsdk/api/data/OneshotEncodeState;->init(Ljava/lang/String;I)V

    .line 1002
    .line 1003
    .line 1004
    new-instance v0, Landroid/util/Pair;

    .line 1005
    .line 1006
    invoke-direct {v0, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1007
    .line 1008
    .line 1009
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 1010
    .line 1011
    const/16 v5, 0x53

    .line 1012
    .line 1013
    invoke-virtual {v4, v5, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1014
    .line 1015
    .line 1016
    move-result-object v0

    .line 1017
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1018
    .line 1019
    .line 1020
    goto/16 :goto_dfb

    .line 1021
    .line 1022
    :cond_3fd
    :goto_3fd
    const-string v0, "onReceiveOneshotEncodeState, data is empty!"

    .line 1023
    .line 1024
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1025
    .line 1026
    .line 1027
    goto/16 :goto_dfb

    .line 1028
    .line 1029
    :pswitch_404
    iget-object v0, v3, Lw8/a;->d:[B

    .line 1030
    .line 1031
    array-length v10, v0

    .line 1032
    if-gtz v10, :cond_41d

    .line 1033
    .line 1034
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1035
    .line 1036
    const-string v5, "onReceiveSmartBluetoothStatus\uff1ainvalid data length "

    .line 1037
    .line 1038
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1039
    .line 1040
    .line 1041
    array-length v0, v0

    .line 1042
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1043
    .line 1044
    .line 1045
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1046
    .line 1047
    .line 1048
    move-result-object v0

    .line 1049
    invoke-static {v14, v0, v2}, LQ8/a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1050
    .line 1051
    .line 1052
    goto/16 :goto_dfb

    .line 1053
    .line 1054
    :cond_41d
    array-length v10, v0

    .line 1055
    if-gtz v10, :cond_427

    .line 1056
    .line 1057
    const-string v6, "parseSmartBluetoothValue The length of data is not valid"

    .line 1058
    .line 1059
    invoke-static {v15, v6}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1060
    .line 1061
    .line 1062
    :cond_425
    move v6, v5

    .line 1063
    goto :goto_42c

    .line 1064
    :cond_427
    aget-byte v10, v0, v5

    .line 1065
    .line 1066
    and-int/2addr v10, v7

    .line 1067
    if-ne v10, v7, :cond_425

    .line 1068
    .line 1069
    :goto_42c
    array-length v10, v0

    .line 1070
    if-gtz v10, :cond_435

    .line 1071
    .line 1072
    const-string v4, "parseHDTValue The length of data is not valid"

    .line 1073
    .line 1074
    invoke-static {v15, v4}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1075
    .line 1076
    .line 1077
    goto :goto_43b

    .line 1078
    :cond_435
    aget-byte v5, v0, v5

    .line 1079
    .line 1080
    shr-int/lit8 v4, v5, 0x4

    .line 1081
    .line 1082
    and-int/lit8 v5, v4, 0x3

    .line 1083
    .line 1084
    :goto_43b
    new-instance v4, LKb/j;

    .line 1085
    .line 1086
    invoke-direct {v4, v5, v0, v6}, LKb/j;-><init>(I[BZ)V

    .line 1087
    .line 1088
    .line 1089
    invoke-static {v14, v4, v2}, LQ8/a;->d(Ljava/lang/String;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 1090
    .line 1091
    .line 1092
    new-instance v0, Lkotlin/Triple;

    .line 1093
    .line 1094
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1095
    .line 1096
    .line 1097
    move-result-object v4

    .line 1098
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1099
    .line 1100
    .line 1101
    move-result-object v5

    .line 1102
    invoke-direct {v0, v2, v4, v5}, Lkotlin/Triple;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1103
    .line 1104
    .line 1105
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 1106
    .line 1107
    const/16 v5, 0x52

    .line 1108
    .line 1109
    invoke-virtual {v4, v5, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1110
    .line 1111
    .line 1112
    move-result-object v0

    .line 1113
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1114
    .line 1115
    .line 1116
    goto/16 :goto_dfb

    .line 1117
    .line 1118
    :pswitch_45d
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1119
    .line 1120
    .line 1121
    move-result v0

    .line 1122
    if-eqz v0, :cond_46a

    .line 1123
    .line 1124
    const-string v0, "onReceiveOneshotAudioData, address is empty!"

    .line 1125
    .line 1126
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1127
    .line 1128
    .line 1129
    goto/16 :goto_dfb

    .line 1130
    .line 1131
    :cond_46a
    iget-object v0, v3, Lw8/a;->d:[B

    .line 1132
    .line 1133
    if-nez v0, :cond_475

    .line 1134
    .line 1135
    const-string v0, "onReceiveOneshotAudioData, data is null!"

    .line 1136
    .line 1137
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1138
    .line 1139
    .line 1140
    goto/16 :goto_dfb

    .line 1141
    .line 1142
    :cond_475
    array-length v4, v0

    .line 1143
    if-gtz v4, :cond_47f

    .line 1144
    .line 1145
    const-string v0, "onReceiveOneshotAudioData, The length is invalid when receive data."

    .line 1146
    .line 1147
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1148
    .line 1149
    .line 1150
    goto/16 :goto_dfb

    .line 1151
    .line 1152
    :cond_47f
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/OneshotAudioDataInfo;

    .line 1153
    .line 1154
    invoke-direct {v4}, Lcom/oplus/melody/btsdk/api/data/OneshotAudioDataInfo;-><init>()V

    .line 1155
    .line 1156
    .line 1157
    invoke-virtual {v4, v2, v5, v0}, Lcom/oplus/melody/btsdk/api/data/OneshotAudioDataInfo;->initData(Ljava/lang/String;I[B)V

    .line 1158
    .line 1159
    .line 1160
    new-instance v0, Landroid/util/Pair;

    .line 1161
    .line 1162
    invoke-direct {v0, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1163
    .line 1164
    .line 1165
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 1166
    .line 1167
    const/16 v5, 0x50

    .line 1168
    .line 1169
    invoke-virtual {v4, v5, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1170
    .line 1171
    .line 1172
    move-result-object v0

    .line 1173
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1174
    .line 1175
    .line 1176
    goto/16 :goto_dfb

    .line 1177
    .line 1178
    :pswitch_499
    iget-object v0, v3, Lw8/a;->d:[B

    .line 1179
    .line 1180
    array-length v4, v0

    .line 1181
    if-gtz v4, :cond_4b5

    .line 1182
    .line 1183
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1184
    .line 1185
    const-string v5, "onReceiveTip, receive data not valid, data = "

    .line 1186
    .line 1187
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1188
    .line 1189
    .line 1190
    invoke-static {v0}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    .line 1191
    .line 1192
    .line 1193
    move-result-object v0

    .line 1194
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1195
    .line 1196
    .line 1197
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1198
    .line 1199
    .line 1200
    move-result-object v0

    .line 1201
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1202
    .line 1203
    .line 1204
    goto/16 :goto_dfb

    .line 1205
    .line 1206
    :cond_4b5
    aget-byte v0, v0, v5

    .line 1207
    .line 1208
    new-instance v4, LAb/r0;

    .line 1209
    .line 1210
    const/16 v6, 0x1d

    .line 1211
    .line 1212
    invoke-direct {v4, v0, v6}, LAb/r0;-><init>(II)V

    .line 1213
    .line 1214
    .line 1215
    invoke-static {v14, v4}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 1216
    .line 1217
    .line 1218
    new-instance v4, Landroid/util/Pair;

    .line 1219
    .line 1220
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1221
    .line 1222
    .line 1223
    move-result-object v0

    .line 1224
    invoke-direct {v4, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1225
    .line 1226
    .line 1227
    iget-object v0, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 1228
    .line 1229
    const/16 v6, 0x4b

    .line 1230
    .line 1231
    invoke-virtual {v0, v6, v5, v5, v4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 1232
    .line 1233
    .line 1234
    move-result-object v0

    .line 1235
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1236
    .line 1237
    .line 1238
    goto/16 :goto_dfb

    .line 1239
    .line 1240
    :pswitch_4d7
    iget-object v0, v3, Lw8/a;->d:[B

    .line 1241
    .line 1242
    invoke-static {v5, v0}, Lcom/oplus/melody/btsdk/protocol/commands/e;->m(I[B)Ljava/util/ArrayList;

    .line 1243
    .line 1244
    .line 1245
    move-result-object v4

    .line 1246
    if-nez v4, :cond_4f6

    .line 1247
    .line 1248
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1249
    .line 1250
    const-string v5, "onReceiveRemoteVersion "

    .line 1251
    .line 1252
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1253
    .line 1254
    .line 1255
    invoke-static {v0}, Lcom/oplus/melody/common/util/J;->c([B)Ljava/lang/String;

    .line 1256
    .line 1257
    .line 1258
    move-result-object v0

    .line 1259
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1260
    .line 1261
    .line 1262
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1263
    .line 1264
    .line 1265
    move-result-object v0

    .line 1266
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1267
    .line 1268
    .line 1269
    goto/16 :goto_dfb

    .line 1270
    .line 1271
    :cond_4f6
    invoke-static {v2, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 1272
    .line 1273
    .line 1274
    move-result-object v0

    .line 1275
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 1276
    .line 1277
    const/16 v5, 0x9

    .line 1278
    .line 1279
    invoke-virtual {v4, v5, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1280
    .line 1281
    .line 1282
    move-result-object v0

    .line 1283
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1284
    .line 1285
    .line 1286
    goto/16 :goto_dfb

    .line 1287
    .line 1288
    :pswitch_507
    iget-object v0, v3, Lw8/a;->d:[B

    .line 1289
    .line 1290
    aget-byte v0, v0, v5

    .line 1291
    .line 1292
    new-instance v4, Landroid/util/Pair;

    .line 1293
    .line 1294
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1295
    .line 1296
    .line 1297
    move-result-object v5

    .line 1298
    invoke-direct {v4, v2, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1299
    .line 1300
    .line 1301
    new-instance v5, LA9/l;

    .line 1302
    .line 1303
    const/16 v6, 0x19

    .line 1304
    .line 1305
    invoke-direct {v5, v0, v6}, LA9/l;-><init>(II)V

    .line 1306
    .line 1307
    .line 1308
    invoke-static {v14, v5}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 1309
    .line 1310
    .line 1311
    iget-object v0, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 1312
    .line 1313
    const/16 v5, 0x46

    .line 1314
    .line 1315
    invoke-virtual {v0, v5, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1316
    .line 1317
    .line 1318
    move-result-object v0

    .line 1319
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1320
    .line 1321
    .line 1322
    goto/16 :goto_dfb

    .line 1323
    .line 1324
    :pswitch_52b
    iget-object v0, v3, Lw8/a;->d:[B

    .line 1325
    .line 1326
    array-length v4, v0

    .line 1327
    if-gtz v4, :cond_537

    .line 1328
    .line 1329
    const-string v0, "onReceiveVoiceRecognition, receive data not valid"

    .line 1330
    .line 1331
    invoke-static {v14, v0, v2}, LQ8/a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1332
    .line 1333
    .line 1334
    goto/16 :goto_dfb

    .line 1335
    .line 1336
    :cond_537
    aget-byte v0, v0, v5

    .line 1337
    .line 1338
    new-instance v4, LAb/F;

    .line 1339
    .line 1340
    invoke-direct {v4, v0, v12}, LAb/F;-><init>(II)V

    .line 1341
    .line 1342
    .line 1343
    invoke-static {v14, v4, v2}, LQ8/a;->d(Ljava/lang/String;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 1344
    .line 1345
    .line 1346
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/SimpleStateInfo;

    .line 1347
    .line 1348
    invoke-direct {v4, v2, v0}, Lcom/oplus/melody/btsdk/api/data/SimpleStateInfo;-><init>(Ljava/lang/String;I)V

    .line 1349
    .line 1350
    .line 1351
    iget-object v0, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 1352
    .line 1353
    const/16 v5, 0x3f

    .line 1354
    .line 1355
    invoke-virtual {v0, v5, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1356
    .line 1357
    .line 1358
    move-result-object v0

    .line 1359
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1360
    .line 1361
    .line 1362
    goto/16 :goto_dfb

    .line 1363
    .line 1364
    :pswitch_553
    invoke-static {}, Lcom/oplus/melody/common/util/S;->g()Landroid/content/ComponentName;

    .line 1365
    .line 1366
    .line 1367
    move-result-object v0

    .line 1368
    if-eqz v0, :cond_566

    .line 1369
    .line 1370
    invoke-static {v2}, Ln8/e;->a(Ljava/lang/String;)Ljava/util/List;

    .line 1371
    .line 1372
    .line 1373
    move-result-object v4

    .line 1374
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 1375
    .line 1376
    .line 1377
    move-result-object v0

    .line 1378
    invoke-interface {v4, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 1379
    .line 1380
    .line 1381
    move-result v0

    .line 1382
    goto :goto_567

    .line 1383
    :cond_566
    move v0, v5

    .line 1384
    :goto_567
    int-to-byte v4, v6

    .line 1385
    int-to-byte v10, v0

    .line 1386
    new-array v7, v7, [B

    .line 1387
    .line 1388
    aput-byte v5, v7, v5

    .line 1389
    .line 1390
    aput-byte v4, v7, v6

    .line 1391
    .line 1392
    aput-byte v10, v7, v28

    .line 1393
    .line 1394
    new-instance v4, Lcom/oplus/melody/btsdk/protocol/commands/o;

    .line 1395
    .line 1396
    invoke-direct {v4, v0, v5}, Lcom/oplus/melody/btsdk/protocol/commands/o;-><init>(II)V

    .line 1397
    .line 1398
    .line 1399
    invoke-static {v14, v4}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 1400
    .line 1401
    .line 1402
    iget-object v0, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->b:Lw8/b;

    .line 1403
    .line 1404
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1405
    .line 1406
    .line 1407
    invoke-static {v3, v7}, Lw8/b;->b(Lw8/a;[B)Lw8/a;

    .line 1408
    .line 1409
    .line 1410
    move-result-object v0

    .line 1411
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->c:Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;

    .line 1412
    .line 1413
    invoke-virtual {v4, v2, v0}, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->z0(Ljava/lang/String;Lw8/a;)Z

    .line 1414
    .line 1415
    .line 1416
    goto/16 :goto_dfb

    .line 1417
    .line 1418
    :pswitch_589
    iget-object v0, v3, Lw8/a;->d:[B

    .line 1419
    .line 1420
    array-length v10, v0

    .line 1421
    if-gtz v10, :cond_5a2

    .line 1422
    .line 1423
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1424
    .line 1425
    const-string v5, "onReceiveSpineRelatedData\uff1ainvalid data length "

    .line 1426
    .line 1427
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1428
    .line 1429
    .line 1430
    array-length v0, v0

    .line 1431
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1432
    .line 1433
    .line 1434
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1435
    .line 1436
    .line 1437
    move-result-object v0

    .line 1438
    invoke-static {v14, v0, v2}, LQ8/a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1439
    .line 1440
    .line 1441
    goto/16 :goto_dfb

    .line 1442
    .line 1443
    :cond_5a2
    aget-byte v10, v0, v5

    .line 1444
    .line 1445
    iget-object v8, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 1446
    .line 1447
    if-eq v10, v6, :cond_79d

    .line 1448
    .line 1449
    const/4 v11, 0x0

    .line 1450
    if-eq v10, v7, :cond_679

    .line 1451
    .line 1452
    if-eq v10, v4, :cond_602

    .line 1453
    .line 1454
    if-eq v10, v13, :cond_5db

    .line 1455
    .line 1456
    const/4 v4, 0x6

    .line 1457
    if-eq v10, v4, :cond_5b4

    .line 1458
    .line 1459
    goto/16 :goto_dfb

    .line 1460
    .line 1461
    :cond_5b4
    new-instance v0, Landroid/util/Pair;

    .line 1462
    .line 1463
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 1464
    .line 1465
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 1466
    .line 1467
    .line 1468
    move-result-wide v6

    .line 1469
    invoke-virtual {v4, v6, v7}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    .line 1470
    .line 1471
    .line 1472
    move-result-wide v6

    .line 1473
    long-to-int v4, v6

    .line 1474
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1475
    .line 1476
    .line 1477
    move-result-object v4

    .line 1478
    invoke-direct {v0, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1479
    .line 1480
    .line 1481
    new-instance v4, Lcom/oplus/melody/btsdk/protocol/commands/n;

    .line 1482
    .line 1483
    invoke-direct {v4, v0, v5}, Lcom/oplus/melody/btsdk/protocol/commands/n;-><init>(Landroid/util/Pair;I)V

    .line 1484
    .line 1485
    .line 1486
    invoke-static {v14, v4}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 1487
    .line 1488
    .line 1489
    const/16 v4, 0x44

    .line 1490
    .line 1491
    invoke-virtual {v8, v4, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1492
    .line 1493
    .line 1494
    move-result-object v0

    .line 1495
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1496
    .line 1497
    .line 1498
    goto/16 :goto_dfb

    .line 1499
    .line 1500
    :cond_5db
    new-instance v0, Landroid/util/Pair;

    .line 1501
    .line 1502
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 1503
    .line 1504
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 1505
    .line 1506
    .line 1507
    move-result-wide v5

    .line 1508
    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    .line 1509
    .line 1510
    .line 1511
    move-result-wide v4

    .line 1512
    long-to-int v4, v4

    .line 1513
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1514
    .line 1515
    .line 1516
    move-result-object v4

    .line 1517
    invoke-direct {v0, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1518
    .line 1519
    .line 1520
    new-instance v4, Lcb/f;

    .line 1521
    .line 1522
    invoke-direct {v4, v0, v13}, Lcb/f;-><init>(Ljava/lang/Object;I)V

    .line 1523
    .line 1524
    .line 1525
    invoke-static {v14, v4}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 1526
    .line 1527
    .line 1528
    const/16 v4, 0x43

    .line 1529
    .line 1530
    invoke-virtual {v8, v4, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1531
    .line 1532
    .line 1533
    move-result-object v0

    .line 1534
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1535
    .line 1536
    .line 1537
    goto/16 :goto_dfb

    .line 1538
    .line 1539
    :cond_602
    array-length v10, v0

    .line 1540
    const/4 v12, 0x7

    .line 1541
    if-gt v10, v12, :cond_60c

    .line 1542
    .line 1543
    const-string v0, "parseSpineRangeDetectionResult The length of data is not valid"

    .line 1544
    .line 1545
    invoke-static {v15, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1546
    .line 1547
    .line 1548
    goto :goto_661

    .line 1549
    :cond_60c
    aget-byte v10, v0, v6

    .line 1550
    .line 1551
    aget-byte v11, v0, v28

    .line 1552
    .line 1553
    aget-byte v12, v0, v7

    .line 1554
    .line 1555
    aget-byte v15, v0, v4

    .line 1556
    .line 1557
    aget-byte v13, v0, v13

    .line 1558
    .line 1559
    const/16 v24, 0x6

    .line 1560
    .line 1561
    aget-byte v0, v0, v24

    .line 1562
    .line 1563
    new-array v4, v4, [B

    .line 1564
    .line 1565
    aput-byte v12, v4, v5

    .line 1566
    .line 1567
    aput-byte v15, v4, v6

    .line 1568
    .line 1569
    aput-byte v13, v4, v28

    .line 1570
    .line 1571
    aput-byte v0, v4, v7

    .line 1572
    .line 1573
    aget-byte v0, v4, v5

    .line 1574
    .line 1575
    and-int/lit16 v0, v0, 0xff

    .line 1576
    .line 1577
    aget-byte v6, v4, v6

    .line 1578
    .line 1579
    and-int/lit16 v6, v6, 0xff

    .line 1580
    .line 1581
    shl-int/lit8 v6, v6, 0x8

    .line 1582
    .line 1583
    or-int/2addr v0, v6

    .line 1584
    aget-byte v6, v4, v28

    .line 1585
    .line 1586
    and-int/lit16 v6, v6, 0xff

    .line 1587
    .line 1588
    shl-int/lit8 v6, v6, 0x10

    .line 1589
    .line 1590
    or-int/2addr v0, v6

    .line 1591
    aget-byte v4, v4, v7

    .line 1592
    .line 1593
    and-int/lit16 v4, v4, 0xff

    .line 1594
    .line 1595
    shl-int/lit8 v4, v4, 0x18

    .line 1596
    .line 1597
    or-int/2addr v0, v4

    .line 1598
    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    .line 1599
    .line 1600
    .line 1601
    move-result v0

    .line 1602
    sget-object v4, Lcom/oplus/melody/common/util/U;->a:Ljava/security/SecureRandom;

    .line 1603
    .line 1604
    invoke-virtual {v4}, Ljava/util/Random;->nextFloat()F

    .line 1605
    .line 1606
    .line 1607
    move-result v4

    .line 1608
    int-to-float v6, v10

    .line 1609
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 1610
    .line 1611
    .line 1612
    move-result-object v6

    .line 1613
    int-to-float v7, v11

    .line 1614
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 1615
    .line 1616
    .line 1617
    move-result-object v7

    .line 1618
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 1619
    .line 1620
    .line 1621
    move-result-object v0

    .line 1622
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 1623
    .line 1624
    .line 1625
    move-result-object v4

    .line 1626
    filled-new-array {v6, v7, v0, v4}, [Ljava/lang/Float;

    .line 1627
    .line 1628
    .line 1629
    move-result-object v0

    .line 1630
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 1631
    .line 1632
    .line 1633
    move-result-object v11

    .line 1634
    :goto_661
    new-instance v0, Landroid/util/Pair;

    .line 1635
    .line 1636
    invoke-direct {v0, v2, v11}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1637
    .line 1638
    .line 1639
    new-instance v4, Lcom/oplus/melody/btsdk/protocol/commands/q;

    .line 1640
    .line 1641
    invoke-direct {v4, v0, v5}, Lcom/oplus/melody/btsdk/protocol/commands/q;-><init>(Landroid/util/Pair;I)V

    .line 1642
    .line 1643
    .line 1644
    invoke-static {v14, v4}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 1645
    .line 1646
    .line 1647
    const/16 v4, 0x40

    .line 1648
    .line 1649
    invoke-virtual {v8, v4, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1650
    .line 1651
    .line 1652
    move-result-object v0

    .line 1653
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1654
    .line 1655
    .line 1656
    goto/16 :goto_dfb

    .line 1657
    .line 1658
    :cond_679
    array-length v10, v0

    .line 1659
    const/16 v12, 0xc

    .line 1660
    .line 1661
    if-gt v10, v12, :cond_685

    .line 1662
    .line 1663
    const-string v0, "The length of data is not valid when parse bass engine status"

    .line 1664
    .line 1665
    invoke-static {v15, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1666
    .line 1667
    .line 1668
    goto/16 :goto_77c

    .line 1669
    .line 1670
    :cond_685
    new-instance v11, Ljava/util/ArrayList;

    .line 1671
    .line 1672
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 1673
    .line 1674
    .line 1675
    aget-byte v10, v0, v6

    .line 1676
    .line 1677
    move/from16 v22, v12

    .line 1678
    .line 1679
    move v12, v5

    .line 1680
    :goto_68f
    if-ge v12, v10, :cond_77c

    .line 1681
    .line 1682
    mul-int/lit8 v19, v12, 0xc

    .line 1683
    .line 1684
    move/from16 v26, v13

    .line 1685
    .line 1686
    add-int/lit8 v13, v19, 0x1

    .line 1687
    .line 1688
    move/from16 v29, v7

    .line 1689
    .line 1690
    array-length v7, v0

    .line 1691
    move/from16 v30, v6

    .line 1692
    .line 1693
    add-int/lit8 v6, v19, 0xd

    .line 1694
    .line 1695
    if-ge v7, v6, :cond_6bc

    .line 1696
    .line 1697
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1698
    .line 1699
    const-string v5, "out of index "

    .line 1700
    .line 1701
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1702
    .line 1703
    .line 1704
    array-length v0, v0

    .line 1705
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1706
    .line 1707
    .line 1708
    const-string v0, " offset "

    .line 1709
    .line 1710
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1711
    .line 1712
    .line 1713
    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1714
    .line 1715
    .line 1716
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1717
    .line 1718
    .line 1719
    move-result-object v0

    .line 1720
    invoke-static {v15, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1721
    .line 1722
    .line 1723
    goto/16 :goto_77c

    .line 1724
    .line 1725
    :cond_6bc
    new-instance v7, Lcom/oplus/melody/btsdk/api/data/SpineHistoryDataInfo;

    .line 1726
    .line 1727
    invoke-direct {v7}, Lcom/oplus/melody/btsdk/api/data/SpineHistoryDataInfo;-><init>()V

    .line 1728
    .line 1729
    .line 1730
    add-int/lit8 v13, v19, 0x2

    .line 1731
    .line 1732
    aget-byte v13, v0, v13

    .line 1733
    .line 1734
    add-int/lit8 v27, v19, 0x3

    .line 1735
    .line 1736
    aget-byte v27, v0, v27

    .line 1737
    .line 1738
    add-int/lit8 v31, v19, 0x4

    .line 1739
    .line 1740
    aget-byte v31, v0, v31

    .line 1741
    .line 1742
    add-int/lit8 v32, v19, 0x5

    .line 1743
    .line 1744
    aget-byte v32, v0, v32

    .line 1745
    .line 1746
    move/from16 v33, v5

    .line 1747
    .line 1748
    new-array v5, v4, [B

    .line 1749
    .line 1750
    aput-byte v13, v5, v33

    .line 1751
    .line 1752
    aput-byte v27, v5, v30

    .line 1753
    .line 1754
    aput-byte v31, v5, v28

    .line 1755
    .line 1756
    aput-byte v32, v5, v29

    .line 1757
    .line 1758
    aget-byte v13, v5, v33

    .line 1759
    .line 1760
    and-int/lit16 v13, v13, 0xff

    .line 1761
    .line 1762
    aget-byte v27, v5, v30

    .line 1763
    .line 1764
    shl-int/lit8 v27, v27, 0x8

    .line 1765
    .line 1766
    const v31, 0xff00

    .line 1767
    .line 1768
    .line 1769
    and-int v27, v27, v31

    .line 1770
    .line 1771
    or-int v13, v13, v27

    .line 1772
    .line 1773
    aget-byte v27, v5, v28

    .line 1774
    .line 1775
    shl-int/lit8 v27, v27, 0x10

    .line 1776
    .line 1777
    const/high16 v31, 0xff0000

    .line 1778
    .line 1779
    and-int v27, v27, v31

    .line 1780
    .line 1781
    or-int v13, v13, v27

    .line 1782
    .line 1783
    aget-byte v5, v5, v29

    .line 1784
    .line 1785
    shl-int/lit8 v5, v5, 0x18

    .line 1786
    .line 1787
    const/high16 v27, -0x1000000

    .line 1788
    .line 1789
    and-int v5, v5, v27

    .line 1790
    .line 1791
    or-int/2addr v5, v13

    .line 1792
    iput v5, v7, Lcom/oplus/melody/btsdk/api/data/SpineHistoryDataInfo;->mUtcTime:I

    .line 1793
    .line 1794
    const/16 v24, 0x6

    .line 1795
    .line 1796
    add-int/lit8 v5, v19, 0x6

    .line 1797
    .line 1798
    aget-byte v5, v0, v5

    .line 1799
    .line 1800
    const/16 v23, 0x7

    .line 1801
    .line 1802
    add-int/lit8 v13, v19, 0x7

    .line 1803
    .line 1804
    aget-byte v13, v0, v13

    .line 1805
    .line 1806
    move-object/from16 v27, v0

    .line 1807
    .line 1808
    move/from16 v4, v28

    .line 1809
    .line 1810
    new-array v0, v4, [B

    .line 1811
    .line 1812
    aput-byte v5, v0, v33

    .line 1813
    .line 1814
    aput-byte v13, v0, v30

    .line 1815
    .line 1816
    move/from16 v5, v33

    .line 1817
    .line 1818
    invoke-static {v5, v0}, LWa/a;->h(I[B)I

    .line 1819
    .line 1820
    .line 1821
    move-result v0

    .line 1822
    iput v0, v7, Lcom/oplus/melody/btsdk/api/data/SpineHistoryDataInfo;->mNormalTimes:I

    .line 1823
    .line 1824
    add-int/lit8 v13, v19, 0x8

    .line 1825
    .line 1826
    aget-byte v0, v27, v13

    .line 1827
    .line 1828
    const/16 v25, 0x9

    .line 1829
    .line 1830
    add-int/lit8 v13, v19, 0x9

    .line 1831
    .line 1832
    aget-byte v13, v27, v13

    .line 1833
    .line 1834
    new-array v5, v4, [B

    .line 1835
    .line 1836
    aput-byte v0, v5, v33

    .line 1837
    .line 1838
    aput-byte v13, v5, v30

    .line 1839
    .line 1840
    move/from16 v13, v33

    .line 1841
    .line 1842
    invoke-static {v13, v5}, LWa/a;->h(I[B)I

    .line 1843
    .line 1844
    .line 1845
    move-result v0

    .line 1846
    iput v0, v7, Lcom/oplus/melody/btsdk/api/data/SpineHistoryDataInfo;->mMildTimes:I

    .line 1847
    .line 1848
    add-int/lit8 v0, v19, 0xa

    .line 1849
    .line 1850
    aget-byte v0, v27, v0

    .line 1851
    .line 1852
    add-int/lit8 v19, v19, 0xb

    .line 1853
    .line 1854
    aget-byte v5, v27, v19

    .line 1855
    .line 1856
    new-array v13, v4, [B

    .line 1857
    .line 1858
    aput-byte v0, v13, v33

    .line 1859
    .line 1860
    aput-byte v5, v13, v30

    .line 1861
    .line 1862
    move/from16 v5, v33

    .line 1863
    .line 1864
    invoke-static {v5, v13}, LWa/a;->h(I[B)I

    .line 1865
    .line 1866
    .line 1867
    move-result v0

    .line 1868
    iput v0, v7, Lcom/oplus/melody/btsdk/api/data/SpineHistoryDataInfo;->mBadTimes:I

    .line 1869
    .line 1870
    aget-byte v0, v27, v19

    .line 1871
    .line 1872
    aget-byte v6, v27, v6

    .line 1873
    .line 1874
    new-array v13, v4, [B

    .line 1875
    .line 1876
    aput-byte v0, v13, v5

    .line 1877
    .line 1878
    aput-byte v6, v13, v30

    .line 1879
    .line 1880
    invoke-static {v5, v13}, LWa/a;->h(I[B)I

    .line 1881
    .line 1882
    .line 1883
    move-result v0

    .line 1884
    iput v0, v7, Lcom/oplus/melody/btsdk/api/data/SpineHistoryDataInfo;->mUnknowns:I

    .line 1885
    .line 1886
    new-instance v0, LUb/a;

    .line 1887
    .line 1888
    const/16 v4, 0xe

    .line 1889
    .line 1890
    invoke-direct {v0, v7, v4}, LUb/a;-><init>(Ljava/lang/Object;I)V

    .line 1891
    .line 1892
    .line 1893
    invoke-static {v15, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 1894
    .line 1895
    .line 1896
    invoke-virtual {v11, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1897
    .line 1898
    .line 1899
    add-int/lit8 v12, v12, 0x1

    .line 1900
    .line 1901
    move/from16 v13, v26

    .line 1902
    .line 1903
    move-object/from16 v0, v27

    .line 1904
    .line 1905
    move/from16 v7, v29

    .line 1906
    .line 1907
    move/from16 v6, v30

    .line 1908
    .line 1909
    const/4 v4, 0x4

    .line 1910
    const/4 v5, 0x0

    .line 1911
    const/16 v22, 0xc

    .line 1912
    .line 1913
    const/16 v28, 0x2

    .line 1914
    .line 1915
    goto/16 :goto_68f

    .line 1916
    .line 1917
    :cond_77c
    :goto_77c
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1918
    .line 1919
    const-string v4, "onReceiveSpineRelatedData MSG_RECEIVE_SPINE_HISTORY_DATA_RESULT: "

    .line 1920
    .line 1921
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1922
    .line 1923
    .line 1924
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1925
    .line 1926
    .line 1927
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1928
    .line 1929
    .line 1930
    move-result-object v0

    .line 1931
    invoke-static {v14, v0}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 1932
    .line 1933
    .line 1934
    new-instance v0, Landroid/util/Pair;

    .line 1935
    .line 1936
    invoke-direct {v0, v2, v11}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1937
    .line 1938
    .line 1939
    const/16 v4, 0x42

    .line 1940
    .line 1941
    invoke-virtual {v8, v4, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1942
    .line 1943
    .line 1944
    move-result-object v0

    .line 1945
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1946
    .line 1947
    .line 1948
    goto/16 :goto_dfb

    .line 1949
    .line 1950
    :cond_79d
    move-object/from16 v27, v0

    .line 1951
    .line 1952
    move/from16 v30, v6

    .line 1953
    .line 1954
    new-instance v0, Landroid/util/Pair;

    .line 1955
    .line 1956
    aget-byte v4, v27, v30

    .line 1957
    .line 1958
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1959
    .line 1960
    .line 1961
    move-result-object v4

    .line 1962
    sget-object v5, Lcom/oplus/melody/common/util/U;->a:Ljava/security/SecureRandom;

    .line 1963
    .line 1964
    invoke-virtual {v5}, Ljava/util/Random;->nextInt()I

    .line 1965
    .line 1966
    .line 1967
    move-result v5

    .line 1968
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1969
    .line 1970
    .line 1971
    move-result-object v5

    .line 1972
    filled-new-array {v4, v5}, [Ljava/lang/Integer;

    .line 1973
    .line 1974
    .line 1975
    move-result-object v4

    .line 1976
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 1977
    .line 1978
    .line 1979
    move-result-object v4

    .line 1980
    invoke-direct {v0, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1981
    .line 1982
    .line 1983
    new-instance v4, Lcom/oplus/melody/btsdk/protocol/commands/n;

    .line 1984
    .line 1985
    move/from16 v5, v30

    .line 1986
    .line 1987
    invoke-direct {v4, v0, v5}, Lcom/oplus/melody/btsdk/protocol/commands/n;-><init>(Landroid/util/Pair;I)V

    .line 1988
    .line 1989
    .line 1990
    invoke-static {v14, v4}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 1991
    .line 1992
    .line 1993
    const/16 v4, 0x41

    .line 1994
    .line 1995
    invoke-virtual {v8, v4, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1996
    .line 1997
    .line 1998
    move-result-object v0

    .line 1999
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2000
    .line 2001
    .line 2002
    goto/16 :goto_dfb

    .line 2003
    .line 2004
    :pswitch_7d3
    move/from16 v29, v7

    .line 2005
    .line 2006
    iget-object v4, v3, Lw8/a;->d:[B

    .line 2007
    .line 2008
    array-length v5, v4

    .line 2009
    if-gtz v5, :cond_7e1

    .line 2010
    .line 2011
    const-string v0, "The length of data is 1, not valid when receive account key"

    .line 2012
    .line 2013
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2014
    .line 2015
    .line 2016
    goto/16 :goto_dfb

    .line 2017
    .line 2018
    :cond_7e1
    array-length v5, v4

    .line 2019
    const-string v6, "The length of data is not valid when parse SendAccountKey"

    .line 2020
    .line 2021
    const-string v7, ""

    .line 2022
    .line 2023
    if-gtz v5, :cond_7ed

    .line 2024
    .line 2025
    invoke-static {v15, v6}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 2026
    .line 2027
    .line 2028
    goto/16 :goto_85c

    .line 2029
    .line 2030
    :cond_7ed
    const/16 v33, 0x0

    .line 2031
    .line 2032
    aget-byte v5, v4, v33

    .line 2033
    .line 2034
    and-int/lit16 v5, v5, 0xff

    .line 2035
    .line 2036
    new-instance v10, LAb/r0;

    .line 2037
    .line 2038
    move/from16 v11, v21

    .line 2039
    .line 2040
    invoke-direct {v10, v5, v11}, LAb/r0;-><init>(II)V

    .line 2041
    .line 2042
    .line 2043
    invoke-static {v15, v10}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2044
    .line 2045
    .line 2046
    const/4 v10, 0x2

    .line 2047
    if-ne v5, v10, :cond_801

    .line 2048
    .line 2049
    goto :goto_85c

    .line 2050
    :cond_801
    :try_start_801
    array-length v5, v4

    .line 2051
    const/4 v10, 0x1

    .line 2052
    if-gt v5, v10, :cond_80b

    .line 2053
    .line 2054
    invoke-static {v15, v6}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 2055
    .line 2056
    .line 2057
    goto :goto_85c

    .line 2058
    :catch_809
    move-exception v0

    .line 2059
    goto :goto_847

    .line 2060
    :cond_80b
    aget-byte v5, v4, v10

    .line 2061
    .line 2062
    and-int/lit16 v5, v5, 0xff

    .line 2063
    .line 2064
    if-gtz v5, :cond_812

    .line 2065
    .line 2066
    goto :goto_85c

    .line 2067
    :cond_812
    const/4 v5, 0x2

    .line 2068
    invoke-static {v4, v5, v10, v10}, Ln7/d;->d([BIIZ)I

    .line 2069
    .line 2070
    .line 2071
    move-result v6

    .line 2072
    add-int/2addr v5, v6

    .line 2073
    array-length v10, v4

    .line 2074
    if-le v5, v10, :cond_838

    .line 2075
    .line 2076
    new-instance v5, Ljava/lang/StringBuilder;

    .line 2077
    .line 2078
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2079
    .line 2080
    .line 2081
    array-length v0, v4

    .line 2082
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2083
    .line 2084
    .line 2085
    const-string v0, " data:"

    .line 2086
    .line 2087
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2088
    .line 2089
    .line 2090
    invoke-static {v4}, LWa/a;->g([B)Ljava/lang/String;

    .line 2091
    .line 2092
    .line 2093
    move-result-object v0

    .line 2094
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2095
    .line 2096
    .line 2097
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2098
    .line 2099
    .line 2100
    move-result-object v0

    .line 2101
    invoke-static {v15, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2102
    .line 2103
    .line 2104
    goto :goto_85c

    .line 2105
    :cond_838
    if-lez v6, :cond_85c

    .line 2106
    .line 2107
    new-array v0, v6, [B

    .line 2108
    .line 2109
    move/from16 v10, v29

    .line 2110
    .line 2111
    const/4 v5, 0x0

    .line 2112
    invoke-static {v4, v10, v0, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2113
    .line 2114
    .line 2115
    invoke-static {v0}, LWa/a;->g([B)Ljava/lang/String;

    .line 2116
    .line 2117
    .line 2118
    move-result-object v7
    :try_end_846
    .catch Ljava/lang/Exception; {:try_start_801 .. :try_end_846} :catch_809

    .line 2119
    goto :goto_85c

    .line 2120
    :goto_847
    new-instance v4, Ljava/lang/StringBuilder;

    .line 2121
    .line 2122
    const-string v5, "parseSendAccountKey throws Exception:"

    .line 2123
    .line 2124
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2125
    .line 2126
    .line 2127
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2128
    .line 2129
    .line 2130
    move-result-object v0

    .line 2131
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2132
    .line 2133
    .line 2134
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2135
    .line 2136
    .line 2137
    move-result-object v0

    .line 2138
    invoke-static {v15, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2139
    .line 2140
    .line 2141
    :cond_85c
    :goto_85c
    new-instance v0, Landroid/util/Pair;

    .line 2142
    .line 2143
    invoke-direct {v0, v2, v7}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2144
    .line 2145
    .line 2146
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 2147
    .line 2148
    const/16 v5, 0x3b

    .line 2149
    .line 2150
    invoke-virtual {v4, v5, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2151
    .line 2152
    .line 2153
    move-result-object v0

    .line 2154
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2155
    .line 2156
    .line 2157
    goto/16 :goto_dfb

    .line 2158
    .line 2159
    :pswitch_86e
    iget-object v0, v3, Lw8/a;->d:[B

    .line 2160
    .line 2161
    array-length v4, v0

    .line 2162
    if-gtz v4, :cond_887

    .line 2163
    .line 2164
    new-instance v4, Ljava/lang/StringBuilder;

    .line 2165
    .line 2166
    const-string v5, "onReceiveBassEngineStatus\uff1ainvalid data length "

    .line 2167
    .line 2168
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2169
    .line 2170
    .line 2171
    array-length v0, v0

    .line 2172
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2173
    .line 2174
    .line 2175
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2176
    .line 2177
    .line 2178
    move-result-object v0

    .line 2179
    invoke-static {v14, v0, v2}, LQ8/a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2180
    .line 2181
    .line 2182
    goto/16 :goto_dfb

    .line 2183
    .line 2184
    :cond_887
    const/4 v5, 0x0

    .line 2185
    invoke-static {v5, v0}, Lcom/oplus/melody/btsdk/protocol/commands/e;->c(I[B)Lcom/oplus/melody/btsdk/api/data/BassEngineInfo;

    .line 2186
    .line 2187
    .line 2188
    move-result-object v0

    .line 2189
    new-instance v4, La8/c;

    .line 2190
    .line 2191
    const/16 v5, 0xe

    .line 2192
    .line 2193
    invoke-direct {v4, v0, v5}, La8/c;-><init>(Ljava/lang/Object;I)V

    .line 2194
    .line 2195
    .line 2196
    invoke-static {v14, v4, v2}, LQ8/a;->d(Ljava/lang/String;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 2197
    .line 2198
    .line 2199
    new-instance v4, Landroid/util/Pair;

    .line 2200
    .line 2201
    invoke-direct {v4, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2202
    .line 2203
    .line 2204
    iget-object v0, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 2205
    .line 2206
    const/16 v5, 0x39

    .line 2207
    .line 2208
    invoke-virtual {v0, v5, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2209
    .line 2210
    .line 2211
    move-result-object v0

    .line 2212
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2213
    .line 2214
    .line 2215
    goto/16 :goto_dfb

    .line 2216
    .line 2217
    :pswitch_8a8
    iget-object v0, v3, Lw8/a;->d:[B

    .line 2218
    .line 2219
    array-length v4, v0

    .line 2220
    if-gtz v4, :cond_8b4

    .line 2221
    .line 2222
    const-string v0, "The length of data is 1, not valid when receive multiply connection info."

    .line 2223
    .line 2224
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2225
    .line 2226
    .line 2227
    goto/16 :goto_dfb

    .line 2228
    .line 2229
    :cond_8b4
    const/16 v33, 0x0

    .line 2230
    .line 2231
    aget-byte v4, v0, v33

    .line 2232
    .line 2233
    new-instance v5, Lcom/oplus/melody/btsdk/protocol/commands/b;

    .line 2234
    .line 2235
    const/4 v10, 0x1

    .line 2236
    invoke-direct {v5, v0, v10}, Lcom/oplus/melody/btsdk/protocol/commands/b;-><init>([BI)V

    .line 2237
    .line 2238
    .line 2239
    invoke-static {v14, v5}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2240
    .line 2241
    .line 2242
    iget-object v0, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 2243
    .line 2244
    const/16 v5, 0x26

    .line 2245
    .line 2246
    const/4 v6, -0x1

    .line 2247
    invoke-virtual {v0, v5, v4, v6, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 2248
    .line 2249
    .line 2250
    move-result-object v0

    .line 2251
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2252
    .line 2253
    .line 2254
    goto/16 :goto_dfb

    .line 2255
    .line 2256
    :pswitch_8cf
    iget-object v0, v3, Lw8/a;->d:[B

    .line 2257
    .line 2258
    array-length v4, v0

    .line 2259
    if-gtz v4, :cond_8db

    .line 2260
    .line 2261
    const-string v0, "onReceiveCustomEq length error"

    .line 2262
    .line 2263
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2264
    .line 2265
    .line 2266
    goto/16 :goto_dfb

    .line 2267
    .line 2268
    :cond_8db
    const/4 v5, 0x0

    .line 2269
    invoke-static {v5, v0}, Lcom/oplus/melody/btsdk/protocol/commands/e;->b(I[B)Ljava/util/List;

    .line 2270
    .line 2271
    .line 2272
    move-result-object v0

    .line 2273
    if-nez v0, :cond_8e9

    .line 2274
    .line 2275
    const-string v0, "onReceiveCustomEq parse list null"

    .line 2276
    .line 2277
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2278
    .line 2279
    .line 2280
    goto/16 :goto_dfb

    .line 2281
    .line 2282
    :cond_8e9
    new-instance v4, LIc/M;

    .line 2283
    .line 2284
    const/4 v5, 0x4

    .line 2285
    invoke-direct {v4, v0, v5}, LIc/M;-><init>(Ljava/util/List;I)V

    .line 2286
    .line 2287
    .line 2288
    invoke-static {v14, v4}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2289
    .line 2290
    .line 2291
    new-instance v4, Landroid/util/Pair;

    .line 2292
    .line 2293
    invoke-direct {v4, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2294
    .line 2295
    .line 2296
    iget-object v0, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 2297
    .line 2298
    const/16 v5, 0x36

    .line 2299
    .line 2300
    invoke-virtual {v0, v5, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2301
    .line 2302
    .line 2303
    move-result-object v0

    .line 2304
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2305
    .line 2306
    .line 2307
    goto/16 :goto_dfb

    .line 2308
    .line 2309
    :pswitch_904
    iget-object v0, v3, Lw8/a;->d:[B

    .line 2310
    .line 2311
    array-length v4, v0

    .line 2312
    const/4 v5, 0x2

    .line 2313
    if-ge v4, v5, :cond_923

    .line 2314
    .line 2315
    new-instance v4, Ljava/lang/StringBuilder;

    .line 2316
    .line 2317
    const-string v5, "onReceiveBreakStatus The length:"

    .line 2318
    .line 2319
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2320
    .line 2321
    .line 2322
    array-length v0, v0

    .line 2323
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2324
    .line 2325
    .line 2326
    const-string v0, " error"

    .line 2327
    .line 2328
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2329
    .line 2330
    .line 2331
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2332
    .line 2333
    .line 2334
    move-result-object v0

    .line 2335
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2336
    .line 2337
    .line 2338
    goto/16 :goto_dfb

    .line 2339
    .line 2340
    :cond_923
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/InterruptInfo;

    .line 2341
    .line 2342
    const/16 v33, 0x0

    .line 2343
    .line 2344
    aget-byte v5, v0, v33

    .line 2345
    .line 2346
    and-int/lit16 v5, v5, 0xff

    .line 2347
    .line 2348
    const/16 v30, 0x1

    .line 2349
    .line 2350
    aget-byte v0, v0, v30

    .line 2351
    .line 2352
    and-int/lit16 v0, v0, 0xff

    .line 2353
    .line 2354
    invoke-direct {v4, v2, v5, v0}, Lcom/oplus/melody/btsdk/api/data/InterruptInfo;-><init>(Ljava/lang/String;II)V

    .line 2355
    .line 2356
    .line 2357
    iget-object v0, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 2358
    .line 2359
    const/16 v5, 0x58

    .line 2360
    .line 2361
    invoke-virtual {v0, v5, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2362
    .line 2363
    .line 2364
    move-result-object v0

    .line 2365
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2366
    .line 2367
    .line 2368
    goto/16 :goto_dfb

    .line 2369
    .line 2370
    :pswitch_941
    iget-object v0, v3, Lw8/a;->d:[B

    .line 2371
    .line 2372
    array-length v4, v0

    .line 2373
    if-gtz v4, :cond_94d

    .line 2374
    .line 2375
    const-string v0, "The length of data is 1, not valid when receive eq mode."

    .line 2376
    .line 2377
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2378
    .line 2379
    .line 2380
    goto/16 :goto_dfb

    .line 2381
    .line 2382
    :cond_94d
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/EqualizerModeInfo;

    .line 2383
    .line 2384
    const/4 v5, 0x0

    .line 2385
    invoke-direct {v4, v5, v0}, Lcom/oplus/melody/btsdk/api/data/EqualizerModeInfo;-><init>(I[B)V

    .line 2386
    .line 2387
    .line 2388
    new-instance v0, Landroid/util/Pair;

    .line 2389
    .line 2390
    invoke-direct {v0, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2391
    .line 2392
    .line 2393
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 2394
    .line 2395
    const/16 v11, 0x18

    .line 2396
    .line 2397
    invoke-virtual {v4, v11, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2398
    .line 2399
    .line 2400
    move-result-object v0

    .line 2401
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2402
    .line 2403
    .line 2404
    goto/16 :goto_dfb

    .line 2405
    .line 2406
    :pswitch_965
    iget-object v0, v3, Lw8/a;->d:[B

    .line 2407
    .line 2408
    const-string v4, "handleRecvFeatureSwitchStatus"

    .line 2409
    .line 2410
    invoke-static {v14, v4}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 2411
    .line 2412
    .line 2413
    array-length v4, v0

    .line 2414
    if-gtz v4, :cond_983

    .line 2415
    .line 2416
    new-instance v4, Ljava/lang/StringBuilder;

    .line 2417
    .line 2418
    const-string v5, "onFeatureSwitchStatusSync\uff1ainvalid data length "

    .line 2419
    .line 2420
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2421
    .line 2422
    .line 2423
    array-length v0, v0

    .line 2424
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2425
    .line 2426
    .line 2427
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2428
    .line 2429
    .line 2430
    move-result-object v0

    .line 2431
    invoke-static {v14, v0, v2}, LQ8/a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2432
    .line 2433
    .line 2434
    goto/16 :goto_dfb

    .line 2435
    .line 2436
    :cond_983
    const/4 v5, 0x0

    .line 2437
    invoke-static {v5, v0}, Lcom/oplus/melody/btsdk/protocol/commands/e;->i(I[B)Ljava/util/ArrayList;

    .line 2438
    .line 2439
    .line 2440
    move-result-object v0

    .line 2441
    if-nez v0, :cond_991

    .line 2442
    .line 2443
    const-string v0, "Error when parse feature switch status information from the packet."

    .line 2444
    .line 2445
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2446
    .line 2447
    .line 2448
    goto/16 :goto_dfb

    .line 2449
    .line 2450
    :cond_991
    new-instance v4, Landroid/util/Pair;

    .line 2451
    .line 2452
    invoke-direct {v4, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2453
    .line 2454
    .line 2455
    new-instance v5, LFa/C;

    .line 2456
    .line 2457
    const/4 v6, 0x6

    .line 2458
    invoke-direct {v5, v0, v6}, LFa/C;-><init>(Ljava/util/ArrayList;I)V

    .line 2459
    .line 2460
    .line 2461
    invoke-static {v14, v5, v2}, LQ8/a;->d(Ljava/lang/String;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 2462
    .line 2463
    .line 2464
    iget-object v0, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 2465
    .line 2466
    invoke-virtual {v0, v11, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2467
    .line 2468
    .line 2469
    move-result-object v0

    .line 2470
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2471
    .line 2472
    .line 2473
    goto/16 :goto_dfb

    .line 2474
    .line 2475
    :pswitch_9aa
    iget-object v0, v3, Lw8/a;->d:[B

    .line 2476
    .line 2477
    const/4 v5, 0x0

    .line 2478
    aget-byte v0, v0, v5

    .line 2479
    .line 2480
    new-instance v4, LA9/l;

    .line 2481
    .line 2482
    const/16 v11, 0x18

    .line 2483
    .line 2484
    invoke-direct {v4, v0, v11}, LA9/l;-><init>(II)V

    .line 2485
    .line 2486
    .line 2487
    invoke-static {v14, v4}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2488
    .line 2489
    .line 2490
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 2491
    .line 2492
    const/16 v6, 0x21

    .line 2493
    .line 2494
    invoke-virtual {v4, v6, v0, v5, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 2495
    .line 2496
    .line 2497
    move-result-object v0

    .line 2498
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2499
    .line 2500
    .line 2501
    goto/16 :goto_dfb

    .line 2502
    .line 2503
    :pswitch_9c6
    new-instance v0, LBc/n;

    .line 2504
    .line 2505
    const/16 v12, 0xc

    .line 2506
    .line 2507
    invoke-direct {v0, v2, v12}, LBc/n;-><init>(Ljava/lang/String;I)V

    .line 2508
    .line 2509
    .line 2510
    invoke-static {v14, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2511
    .line 2512
    .line 2513
    const/16 v0, 0x20

    .line 2514
    .line 2515
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->a:Landroid/os/Handler;

    .line 2516
    .line 2517
    invoke-virtual {v4, v0, v5, v5, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 2518
    .line 2519
    .line 2520
    move-result-object v0

    .line 2521
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2522
    .line 2523
    .line 2524
    goto/16 :goto_dfb

    .line 2525
    .line 2526
    :pswitch_9dd
    move/from16 v26, v13

    .line 2527
    .line 2528
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2529
    .line 2530
    .line 2531
    move-result-wide v4

    .line 2532
    sget-object v0, Lp8/a$a;->a:Lp8/a;

    .line 2533
    .line 2534
    invoke-virtual {v0, v2}, Lp8/a;->a(Ljava/lang/String;)Lcom/oplus/melody/common/data/WhitelistConfigDTO;

    .line 2535
    .line 2536
    .line 2537
    move-result-object v0

    .line 2538
    if-eqz v0, :cond_a02

    .line 2539
    .line 2540
    invoke-virtual {v0}, Lcom/oplus/melody/common/data/WhitelistConfigDTO;->getFunction()Lcom/oplus/melody/common/data/WhitelistConfigDTO$Function;

    .line 2541
    .line 2542
    .line 2543
    move-result-object v6

    .line 2544
    if-eqz v6, :cond_a02

    .line 2545
    .line 2546
    invoke-virtual {v0}, Lcom/oplus/melody/common/data/WhitelistConfigDTO;->getFunction()Lcom/oplus/melody/common/data/WhitelistConfigDTO$Function;

    .line 2547
    .line 2548
    .line 2549
    move-result-object v0

    .line 2550
    invoke-virtual {v0}, Lcom/oplus/melody/common/data/WhitelistConfigDTO$Function;->getUtcTimeZone()I

    .line 2551
    .line 2552
    .line 2553
    move-result v0

    .line 2554
    const/4 v13, 0x0

    .line 2555
    invoke-static {v0, v13}, Lcom/oplus/melody/common/util/Y;->e(IZ)Z

    .line 2556
    .line 2557
    .line 2558
    move-result v0

    .line 2559
    if-eqz v0, :cond_a02

    .line 2560
    .line 2561
    const/4 v6, 0x1

    .line 2562
    goto :goto_a03

    .line 2563
    :cond_a02
    const/4 v6, 0x0

    .line 2564
    :goto_a03
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    .line 2565
    .line 2566
    .line 2567
    move-result-object v0

    .line 2568
    invoke-virtual {v0, v4, v5}, Ljava/util/TimeZone;->getOffset(J)I

    .line 2569
    .line 2570
    .line 2571
    move-result v0

    .line 2572
    new-instance v7, Lcom/oplus/melody/btsdk/protocol/commands/p;

    .line 2573
    .line 2574
    invoke-direct {v7, v4, v5, v0, v6}, Lcom/oplus/melody/btsdk/protocol/commands/p;-><init>(JIZ)V

    .line 2575
    .line 2576
    .line 2577
    invoke-static {v14, v7}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2578
    .line 2579
    .line 2580
    if-eqz v6, :cond_a18

    .line 2581
    .line 2582
    move/from16 v13, v16

    .line 2583
    .line 2584
    goto :goto_a19

    .line 2585
    :cond_a18
    const/4 v13, 0x4

    .line 2586
    :goto_a19
    new-array v7, v13, [B

    .line 2587
    .line 2588
    const-wide/16 v10, 0x3e8

    .line 2589
    .line 2590
    div-long/2addr v4, v10

    .line 2591
    long-to-int v4, v4

    .line 2592
    const/4 v5, 0x0

    .line 2593
    const/4 v10, 0x4

    .line 2594
    invoke-static {v4, v5, v10, v7}, Ln7/d;->b(III[B)V

    .line 2595
    .line 2596
    .line 2597
    if-eqz v6, :cond_a2b

    .line 2598
    .line 2599
    div-int/lit16 v0, v0, 0x3e8

    .line 2600
    .line 2601
    invoke-static {v0, v10, v10, v7}, Ln7/d;->b(III[B)V

    .line 2602
    .line 2603
    .line 2604
    :cond_a2b
    if-eqz v6, :cond_a30

    .line 2605
    .line 2606
    const/16 v13, 0x9

    .line 2607
    .line 2608
    goto :goto_a32

    .line 2609
    :cond_a30
    move/from16 v13, v26

    .line 2610
    .line 2611
    :goto_a32
    invoke-static {v13}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 2612
    .line 2613
    .line 2614
    move-result-object v0

    .line 2615
    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 2616
    .line 2617
    .line 2618
    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 2619
    .line 2620
    .line 2621
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->b:Lw8/b;

    .line 2622
    .line 2623
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 2624
    .line 2625
    .line 2626
    move-result-object v0

    .line 2627
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2628
    .line 2629
    .line 2630
    invoke-static {v3, v0}, Lw8/b;->b(Lw8/a;[B)Lw8/a;

    .line 2631
    .line 2632
    .line 2633
    move-result-object v0

    .line 2634
    iget-object v4, v8, Lcom/oplus/melody/btsdk/protocol/commands/r;->c:Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;

    .line 2635
    .line 2636
    invoke-virtual {v4, v2, v0}, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->z0(Ljava/lang/String;Lw8/a;)Z

    .line 2637
    .line 2638
    .line 2639
    goto/16 :goto_dfb

    .line 2640
    .line 2641
    :cond_a50
    const-string v0, "onReceivePacket params is null, return!"

    .line 2642
    .line 2643
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2644
    .line 2645
    .line 2646
    goto/16 :goto_dfb

    .line 2647
    .line 2648
    :cond_a57
    iget-object v0, v1, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->mSetCommandManager:Lcom/oplus/melody/btsdk/protocol/commands/A;

    .line 2649
    .line 2650
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2651
    .line 2652
    .line 2653
    sget-object v4, LQ8/a;->a:Lcom/oplus/melody/common/util/y$a;

    .line 2654
    .line 2655
    invoke-static {}, Lcom/oplus/melody/common/util/y;->l()Z

    .line 2656
    .line 2657
    .line 2658
    move-result v4

    .line 2659
    const-string v5, "SetCommandManager"

    .line 2660
    .line 2661
    if-eqz v4, :cond_a7f

    .line 2662
    .line 2663
    new-instance v4, Ljava/lang/StringBuilder;

    .line 2664
    .line 2665
    const-string v6, "onReceivePacket key=0x"

    .line 2666
    .line 2667
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2668
    .line 2669
    .line 2670
    invoke-virtual {v3}, Lw8/a;->a()I

    .line 2671
    .line 2672
    .line 2673
    move-result v6

    .line 2674
    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 2675
    .line 2676
    .line 2677
    move-result-object v6

    .line 2678
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2679
    .line 2680
    .line 2681
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2682
    .line 2683
    .line 2684
    move-result-object v4

    .line 2685
    invoke-static {v5, v4}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 2686
    .line 2687
    .line 2688
    :cond_a7f
    iget-object v4, v3, Lw8/a;->d:[B

    .line 2689
    .line 2690
    iget v6, v3, Lw8/a;->a:I

    .line 2691
    .line 2692
    const/16 v7, 0x402

    .line 2693
    .line 2694
    if-eq v6, v7, :cond_d1b

    .line 2695
    .line 2696
    packed-switch v6, :pswitch_data_e60

    .line 2697
    .line 2698
    .line 2699
    const-string v7, "Invalid data length when receive set noise reduction response."

    .line 2700
    .line 2701
    packed-switch v6, :pswitch_data_e68

    .line 2702
    .line 2703
    .line 2704
    packed-switch v6, :pswitch_data_e74

    .line 2705
    .line 2706
    .line 2707
    const-string v7, "Invalid data length when receive set codec type response."

    .line 2708
    .line 2709
    packed-switch v6, :pswitch_data_e8a

    .line 2710
    .line 2711
    .line 2712
    packed-switch v6, :pswitch_data_eb4

    .line 2713
    .line 2714
    .line 2715
    packed-switch v6, :pswitch_data_ec0

    .line 2716
    .line 2717
    .line 2718
    new-instance v0, Lcom/oplus/melody/btsdk/protocol/commands/y;

    .line 2719
    .line 2720
    const/4 v13, 0x0

    .line 2721
    invoke-direct {v0, v3, v13}, Lcom/oplus/melody/btsdk/protocol/commands/y;-><init>(Lw8/a;I)V

    .line 2722
    .line 2723
    .line 2724
    invoke-static {v5, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2725
    .line 2726
    .line 2727
    goto/16 :goto_d44

    .line 2728
    .line 2729
    :pswitch_aa8
    const/4 v13, 0x0

    .line 2730
    array-length v6, v4

    .line 2731
    if-nez v6, :cond_ab3

    .line 2732
    .line 2733
    const-string v0, "Invalid data length when receive set start GMN config response."

    .line 2734
    .line 2735
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2736
    .line 2737
    .line 2738
    goto/16 :goto_d44

    .line 2739
    .line 2740
    :cond_ab3
    aget-byte v4, v4, v13

    .line 2741
    .line 2742
    new-instance v6, Ljava/lang/StringBuilder;

    .line 2743
    .line 2744
    const-string v7, "Receive set start GMN config response status = "

    .line 2745
    .line 2746
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2747
    .line 2748
    .line 2749
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2750
    .line 2751
    .line 2752
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2753
    .line 2754
    .line 2755
    move-result-object v6

    .line 2756
    invoke-static {v5, v6}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 2757
    .line 2758
    .line 2759
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 2760
    .line 2761
    .line 2762
    goto/16 :goto_d44

    .line 2763
    .line 2764
    :pswitch_acb
    array-length v6, v4

    .line 2765
    if-nez v6, :cond_ad5

    .line 2766
    .line 2767
    const-string v0, "Invalid data length when receive CMD_SET_ENABLE_EARPHONE_CONTROL_SOUND_CHANNEL_RSP response."

    .line 2768
    .line 2769
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2770
    .line 2771
    .line 2772
    goto/16 :goto_d44

    .line 2773
    .line 2774
    :cond_ad5
    const/16 v33, 0x0

    .line 2775
    .line 2776
    aget-byte v4, v4, v33

    .line 2777
    .line 2778
    new-instance v6, Lcom/oplus/melody/btsdk/protocol/commands/o;

    .line 2779
    .line 2780
    const/4 v10, 0x2

    .line 2781
    invoke-direct {v6, v4, v10}, Lcom/oplus/melody/btsdk/protocol/commands/o;-><init>(II)V

    .line 2782
    .line 2783
    .line 2784
    invoke-static {v5, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2785
    .line 2786
    .line 2787
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 2788
    .line 2789
    .line 2790
    goto/16 :goto_d44

    .line 2791
    .line 2792
    :pswitch_ae7
    const/16 v33, 0x0

    .line 2793
    .line 2794
    array-length v6, v4

    .line 2795
    if-nez v6, :cond_af3

    .line 2796
    .line 2797
    const-string v0, "setLeBrSwitchState, Invalid data length"

    .line 2798
    .line 2799
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2800
    .line 2801
    .line 2802
    goto/16 :goto_d44

    .line 2803
    .line 2804
    :cond_af3
    aget-byte v4, v4, v33

    .line 2805
    .line 2806
    new-instance v6, Lcom/oplus/melody/btsdk/protocol/commands/o;

    .line 2807
    .line 2808
    const/4 v10, 0x3

    .line 2809
    invoke-direct {v6, v4, v10}, Lcom/oplus/melody/btsdk/protocol/commands/o;-><init>(II)V

    .line 2810
    .line 2811
    .line 2812
    invoke-static {v5, v6, v2}, LQ8/a;->d(Ljava/lang/String;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 2813
    .line 2814
    .line 2815
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 2816
    .line 2817
    .line 2818
    goto/16 :goto_d44

    .line 2819
    .line 2820
    :pswitch_b03
    const/16 v33, 0x0

    .line 2821
    .line 2822
    array-length v6, v4

    .line 2823
    if-nez v6, :cond_b0f

    .line 2824
    .line 2825
    const-string v0, "Invalid data length when receive set GMN voice assist config response."

    .line 2826
    .line 2827
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2828
    .line 2829
    .line 2830
    goto/16 :goto_d44

    .line 2831
    .line 2832
    :cond_b0f
    aget-byte v4, v4, v33

    .line 2833
    .line 2834
    new-instance v6, Ljava/lang/StringBuilder;

    .line 2835
    .line 2836
    const-string v7, "Receive set GMN voice assist config response status = "

    .line 2837
    .line 2838
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2839
    .line 2840
    .line 2841
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2842
    .line 2843
    .line 2844
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2845
    .line 2846
    .line 2847
    move-result-object v6

    .line 2848
    invoke-static {v5, v6}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 2849
    .line 2850
    .line 2851
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 2852
    .line 2853
    .line 2854
    goto/16 :goto_d44

    .line 2855
    .line 2856
    :pswitch_b27
    array-length v6, v4

    .line 2857
    if-nez v6, :cond_b31

    .line 2858
    .line 2859
    const-string v0, "Invalid data length when receive set head motion type response."

    .line 2860
    .line 2861
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2862
    .line 2863
    .line 2864
    goto/16 :goto_d44

    .line 2865
    .line 2866
    :cond_b31
    const/16 v33, 0x0

    .line 2867
    .line 2868
    aget-byte v4, v4, v33

    .line 2869
    .line 2870
    new-instance v6, Ljava/lang/StringBuilder;

    .line 2871
    .line 2872
    const-string v7, "Receive set head motion type response status = "

    .line 2873
    .line 2874
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2875
    .line 2876
    .line 2877
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2878
    .line 2879
    .line 2880
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2881
    .line 2882
    .line 2883
    move-result-object v6

    .line 2884
    invoke-static {v5, v6}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 2885
    .line 2886
    .line 2887
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 2888
    .line 2889
    .line 2890
    goto/16 :goto_d44

    .line 2891
    .line 2892
    :pswitch_b4b
    array-length v0, v4

    .line 2893
    const/4 v10, 0x2

    .line 2894
    if-ge v0, v10, :cond_b56

    .line 2895
    .line 2896
    const-string v0, "CMD_ONE_SHOT_OPERATE_RSP Invalid data length."

    .line 2897
    .line 2898
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2899
    .line 2900
    .line 2901
    goto/16 :goto_d44

    .line 2902
    .line 2903
    :cond_b56
    array-length v0, v4

    .line 2904
    if-ne v0, v10, :cond_b60

    .line 2905
    .line 2906
    const-string v0, "CMD_ONE_SHOT_OPERATE_RSP data.length is 2!, do not parse! operateType is 1 or 2"

    .line 2907
    .line 2908
    invoke-static {v5, v0}, LQ8/a;->m(Ljava/lang/String;Ljava/lang/String;)V

    .line 2909
    .line 2910
    .line 2911
    goto/16 :goto_d44

    .line 2912
    .line 2913
    :cond_b60
    new-instance v0, Lcom/oplus/melody/btsdk/api/data/OneshotStateInfo;

    .line 2914
    .line 2915
    invoke-direct {v0}, Lcom/oplus/melody/btsdk/api/data/OneshotStateInfo;-><init>()V

    .line 2916
    .line 2917
    .line 2918
    const/4 v5, 0x0

    .line 2919
    invoke-virtual {v0, v2, v5, v4}, Lcom/oplus/melody/btsdk/api/data/OneshotStateInfo;->initRspData(Ljava/lang/String;I[B)V

    .line 2920
    .line 2921
    .line 2922
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/BluetoothReceiveData;

    .line 2923
    .line 2924
    const v5, 0x10006a

    .line 2925
    .line 2926
    .line 2927
    invoke-direct {v4, v5, v0}, Lcom/oplus/melody/btsdk/api/data/BluetoothReceiveData;-><init>(ILandroid/os/Parcelable;)V

    .line 2928
    .line 2929
    .line 2930
    sget-object v0, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService$d;->a:Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;

    .line 2931
    .line 2932
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2933
    .line 2934
    .line 2935
    invoke-static {v4}, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->p0(Lcom/oplus/melody/btsdk/api/data/BluetoothReceiveData;)V

    .line 2936
    .line 2937
    .line 2938
    goto/16 :goto_d44

    .line 2939
    .line 2940
    :pswitch_b7b
    array-length v0, v4

    .line 2941
    if-nez v0, :cond_b85

    .line 2942
    .line 2943
    const-string v0, "Invalid data length when receive set device build model response."

    .line 2944
    .line 2945
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2946
    .line 2947
    .line 2948
    goto/16 :goto_d44

    .line 2949
    .line 2950
    :cond_b85
    const-string v0, "onReceivePacket: receive CMD_SET_DEVICE_BUILD_MODEL_RSP... set device build model success..."

    .line 2951
    .line 2952
    invoke-static {v5, v0}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 2953
    .line 2954
    .line 2955
    goto/16 :goto_d44

    .line 2956
    .line 2957
    :pswitch_b8c
    array-length v6, v4

    .line 2958
    if-nez v6, :cond_b96

    .line 2959
    .line 2960
    const-string v0, "Invalid data length when receive set screen off broadcast delay time response."

    .line 2961
    .line 2962
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2963
    .line 2964
    .line 2965
    goto/16 :goto_d44

    .line 2966
    .line 2967
    :cond_b96
    const/16 v33, 0x0

    .line 2968
    .line 2969
    aget-byte v4, v4, v33

    .line 2970
    .line 2971
    new-instance v6, Lcom/oplus/melody/btsdk/protocol/commands/j;

    .line 2972
    .line 2973
    move/from16 v7, v20

    .line 2974
    .line 2975
    invoke-direct {v6, v4, v7}, Lcom/oplus/melody/btsdk/protocol/commands/j;-><init>(II)V

    .line 2976
    .line 2977
    .line 2978
    invoke-static {v5, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2979
    .line 2980
    .line 2981
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 2982
    .line 2983
    .line 2984
    goto/16 :goto_d44

    .line 2985
    .line 2986
    :pswitch_ba9
    const/16 v33, 0x0

    .line 2987
    .line 2988
    array-length v6, v4

    .line 2989
    if-nez v6, :cond_bb5

    .line 2990
    .line 2991
    const-string v0, "Invalid data length when receive set account key response."

    .line 2992
    .line 2993
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2994
    .line 2995
    .line 2996
    goto/16 :goto_d44

    .line 2997
    .line 2998
    :cond_bb5
    aget-byte v4, v4, v33

    .line 2999
    .line 3000
    new-instance v6, LA9/l;

    .line 3001
    .line 3002
    const/16 v7, 0x1c

    .line 3003
    .line 3004
    invoke-direct {v6, v4, v7}, LA9/l;-><init>(II)V

    .line 3005
    .line 3006
    .line 3007
    invoke-static {v5, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3008
    .line 3009
    .line 3010
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3011
    .line 3012
    .line 3013
    goto/16 :goto_d44

    .line 3014
    .line 3015
    :pswitch_bc6
    array-length v6, v4

    .line 3016
    if-nez v6, :cond_bce

    .line 3017
    .line 3018
    invoke-static {v5, v7}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3019
    .line 3020
    .line 3021
    goto/16 :goto_d44

    .line 3022
    .line 3023
    :cond_bce
    const-string v6, "onReceivePacket: receive CMD_SET_BASS_ENGINE_VALUE_RSP...notify set bass engine success..."

    .line 3024
    .line 3025
    invoke-static {v5, v6}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 3026
    .line 3027
    .line 3028
    const/16 v33, 0x0

    .line 3029
    .line 3030
    aget-byte v4, v4, v33

    .line 3031
    .line 3032
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3033
    .line 3034
    .line 3035
    goto/16 :goto_d44

    .line 3036
    .line 3037
    :pswitch_bdc
    const/16 v33, 0x0

    .line 3038
    .line 3039
    array-length v6, v4

    .line 3040
    if-nez v6, :cond_be6

    .line 3041
    .line 3042
    invoke-static {v5, v7}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3043
    .line 3044
    .line 3045
    goto/16 :goto_d44

    .line 3046
    .line 3047
    :cond_be6
    const-string v6, "onReceivePacket: receive CMD_SET_HIGH_AUDIO_CODEC_TYPE_RSP...notify set codec type success..."

    .line 3048
    .line 3049
    invoke-static {v5, v6}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 3050
    .line 3051
    .line 3052
    aget-byte v4, v4, v33

    .line 3053
    .line 3054
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3055
    .line 3056
    .line 3057
    goto/16 :goto_d44

    .line 3058
    .line 3059
    :pswitch_bf2
    const/16 v33, 0x0

    .line 3060
    .line 3061
    goto :goto_c62

    .line 3062
    :pswitch_bf5
    const/16 v33, 0x0

    .line 3063
    .line 3064
    array-length v6, v4

    .line 3065
    const/4 v10, 0x2

    .line 3066
    if-ge v6, v10, :cond_c02

    .line 3067
    .line 3068
    const-string v0, "Invalid data length when receive set eq info response."

    .line 3069
    .line 3070
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3071
    .line 3072
    .line 3073
    goto/16 :goto_d44

    .line 3074
    .line 3075
    :cond_c02
    aget-byte v6, v4, v33

    .line 3076
    .line 3077
    const/4 v10, 0x1

    .line 3078
    aget-byte v4, v4, v10

    .line 3079
    .line 3080
    new-instance v7, LX3/d;

    .line 3081
    .line 3082
    invoke-direct {v7, v6, v4, v10}, LX3/d;-><init>(III)V

    .line 3083
    .line 3084
    .line 3085
    invoke-static {v5, v7}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3086
    .line 3087
    .line 3088
    invoke-virtual {v0, v2, v3, v6}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3089
    .line 3090
    .line 3091
    goto/16 :goto_d44

    .line 3092
    .line 3093
    :pswitch_c14
    array-length v6, v4

    .line 3094
    if-nez v6, :cond_c1e

    .line 3095
    .line 3096
    const-string v0, "Invalid data length when receive CMD_SET_EAR_TONE_INFO_RSP response."

    .line 3097
    .line 3098
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3099
    .line 3100
    .line 3101
    goto/16 :goto_d44

    .line 3102
    .line 3103
    :cond_c1e
    const/4 v13, 0x0

    .line 3104
    aget-byte v4, v4, v13

    .line 3105
    .line 3106
    new-instance v6, Lcom/oplus/melody/btsdk/protocol/commands/x;

    .line 3107
    .line 3108
    invoke-direct {v6, v4, v13}, Lcom/oplus/melody/btsdk/protocol/commands/x;-><init>(II)V

    .line 3109
    .line 3110
    .line 3111
    invoke-static {v5, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3112
    .line 3113
    .line 3114
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3115
    .line 3116
    .line 3117
    goto/16 :goto_d44

    .line 3118
    .line 3119
    :pswitch_c2e
    const/4 v13, 0x0

    .line 3120
    array-length v6, v4

    .line 3121
    if-nez v6, :cond_c37

    .line 3122
    .line 3123
    invoke-static {v5, v7}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3124
    .line 3125
    .line 3126
    goto/16 :goto_d44

    .line 3127
    .line 3128
    :cond_c37
    aget-byte v4, v4, v13

    .line 3129
    .line 3130
    new-instance v6, Lcom/oplus/melody/btsdk/protocol/commands/z;

    .line 3131
    .line 3132
    invoke-direct {v6, v4, v13}, Lcom/oplus/melody/btsdk/protocol/commands/z;-><init>(II)V

    .line 3133
    .line 3134
    .line 3135
    invoke-static {v5, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3136
    .line 3137
    .line 3138
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3139
    .line 3140
    .line 3141
    goto/16 :goto_d44

    .line 3142
    .line 3143
    :pswitch_c46
    const/4 v13, 0x0

    .line 3144
    array-length v6, v4

    .line 3145
    if-nez v6, :cond_c51

    .line 3146
    .line 3147
    const-string v0, "Invalid data length when receive CMD_SET_ZEN_VERIFY_INFO_RSP response."

    .line 3148
    .line 3149
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3150
    .line 3151
    .line 3152
    goto/16 :goto_d44

    .line 3153
    .line 3154
    :cond_c51
    aget-byte v4, v4, v13

    .line 3155
    .line 3156
    new-instance v6, Lcom/oplus/melody/btsdk/protocol/commands/j;

    .line 3157
    .line 3158
    move/from16 v7, v18

    .line 3159
    .line 3160
    invoke-direct {v6, v4, v7}, Lcom/oplus/melody/btsdk/protocol/commands/j;-><init>(II)V

    .line 3161
    .line 3162
    .line 3163
    invoke-static {v5, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3164
    .line 3165
    .line 3166
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3167
    .line 3168
    .line 3169
    goto/16 :goto_d44

    .line 3170
    .line 3171
    :goto_c62
    :pswitch_c62
    array-length v6, v4

    .line 3172
    if-nez v6, :cond_c6c

    .line 3173
    .line 3174
    const-string v0, "Invalid data length when receive switch Command response."

    .line 3175
    .line 3176
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3177
    .line 3178
    .line 3179
    goto/16 :goto_d44

    .line 3180
    .line 3181
    :cond_c6c
    const/4 v13, 0x0

    .line 3182
    aget-byte v4, v4, v13

    .line 3183
    .line 3184
    new-instance v6, Lcom/oplus/melody/btsdk/protocol/commands/z;

    .line 3185
    .line 3186
    const/4 v10, 0x1

    .line 3187
    invoke-direct {v6, v4, v10}, Lcom/oplus/melody/btsdk/protocol/commands/z;-><init>(II)V

    .line 3188
    .line 3189
    .line 3190
    invoke-static {v5, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3191
    .line 3192
    .line 3193
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3194
    .line 3195
    .line 3196
    goto/16 :goto_d44

    .line 3197
    .line 3198
    :pswitch_c7d
    const/4 v13, 0x0

    .line 3199
    array-length v6, v4

    .line 3200
    if-nez v6, :cond_c88

    .line 3201
    .line 3202
    const-string v0, "Invalid data length when receive set eq response."

    .line 3203
    .line 3204
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3205
    .line 3206
    .line 3207
    goto/16 :goto_d44

    .line 3208
    .line 3209
    :cond_c88
    aget-byte v4, v4, v13

    .line 3210
    .line 3211
    new-instance v6, Lcom/oplus/melody/btsdk/protocol/commands/j;

    .line 3212
    .line 3213
    const/16 v12, 0xc

    .line 3214
    .line 3215
    invoke-direct {v6, v4, v12}, Lcom/oplus/melody/btsdk/protocol/commands/j;-><init>(II)V

    .line 3216
    .line 3217
    .line 3218
    invoke-static {v5, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3219
    .line 3220
    .line 3221
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3222
    .line 3223
    .line 3224
    goto/16 :goto_d44

    .line 3225
    .line 3226
    :pswitch_c99
    const/4 v13, 0x0

    .line 3227
    array-length v6, v4

    .line 3228
    if-nez v6, :cond_ca4

    .line 3229
    .line 3230
    const-string v0, "Invalid data length when receive compactness detect response."

    .line 3231
    .line 3232
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3233
    .line 3234
    .line 3235
    goto/16 :goto_d44

    .line 3236
    .line 3237
    :cond_ca4
    aget-byte v4, v4, v13

    .line 3238
    .line 3239
    new-instance v6, Lcom/oplus/melody/btsdk/protocol/commands/x;

    .line 3240
    .line 3241
    const/4 v10, 0x2

    .line 3242
    invoke-direct {v6, v4, v10}, Lcom/oplus/melody/btsdk/protocol/commands/x;-><init>(II)V

    .line 3243
    .line 3244
    .line 3245
    invoke-static {v5, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3246
    .line 3247
    .line 3248
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3249
    .line 3250
    .line 3251
    goto/16 :goto_d44

    .line 3252
    .line 3253
    :pswitch_cb4
    const/4 v13, 0x0

    .line 3254
    array-length v6, v4

    .line 3255
    if-nez v6, :cond_cbd

    .line 3256
    .line 3257
    invoke-static {v5, v7}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3258
    .line 3259
    .line 3260
    goto/16 :goto_d44

    .line 3261
    .line 3262
    :cond_cbd
    aget-byte v4, v4, v13

    .line 3263
    .line 3264
    new-instance v6, Lcom/oplus/melody/btsdk/protocol/commands/x;

    .line 3265
    .line 3266
    const/4 v10, 0x1

    .line 3267
    invoke-direct {v6, v4, v10}, Lcom/oplus/melody/btsdk/protocol/commands/x;-><init>(II)V

    .line 3268
    .line 3269
    .line 3270
    invoke-static {v5, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3271
    .line 3272
    .line 3273
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3274
    .line 3275
    .line 3276
    goto/16 :goto_d44

    .line 3277
    .line 3278
    :pswitch_ccd
    const/4 v13, 0x0

    .line 3279
    array-length v6, v4

    .line 3280
    if-nez v6, :cond_cd7

    .line 3281
    .line 3282
    const-string v0, "Invalid data length when receive switch feature response."

    .line 3283
    .line 3284
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3285
    .line 3286
    .line 3287
    goto :goto_d44

    .line 3288
    :cond_cd7
    aget-byte v4, v4, v13

    .line 3289
    .line 3290
    new-instance v6, Lcom/oplus/melody/btsdk/protocol/commands/j;

    .line 3291
    .line 3292
    move/from16 v7, v17

    .line 3293
    .line 3294
    invoke-direct {v6, v4, v7}, Lcom/oplus/melody/btsdk/protocol/commands/j;-><init>(II)V

    .line 3295
    .line 3296
    .line 3297
    invoke-static {v5, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3298
    .line 3299
    .line 3300
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3301
    .line 3302
    .line 3303
    goto :goto_d44

    .line 3304
    :pswitch_ce7
    const/4 v13, 0x0

    .line 3305
    array-length v6, v4

    .line 3306
    if-nez v6, :cond_cf1

    .line 3307
    .line 3308
    const-string v0, "Invalid data length when receive key function response."

    .line 3309
    .line 3310
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3311
    .line 3312
    .line 3313
    goto :goto_d44

    .line 3314
    :cond_cf1
    aget-byte v4, v4, v13

    .line 3315
    .line 3316
    new-instance v6, LA9/l;

    .line 3317
    .line 3318
    const/16 v7, 0x1d

    .line 3319
    .line 3320
    invoke-direct {v6, v4, v7}, LA9/l;-><init>(II)V

    .line 3321
    .line 3322
    .line 3323
    invoke-static {v5, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3324
    .line 3325
    .line 3326
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3327
    .line 3328
    .line 3329
    goto :goto_d44

    .line 3330
    :pswitch_d01
    const/4 v13, 0x0

    .line 3331
    array-length v6, v4

    .line 3332
    if-nez v6, :cond_d0b

    .line 3333
    .line 3334
    const-string v0, "Invalid data length when receive find mode response."

    .line 3335
    .line 3336
    invoke-static {v5, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3337
    .line 3338
    .line 3339
    goto :goto_d44

    .line 3340
    :cond_d0b
    aget-byte v4, v4, v13

    .line 3341
    .line 3342
    new-instance v6, Lcom/oplus/melody/btsdk/protocol/commands/j;

    .line 3343
    .line 3344
    const/16 v7, 0x9

    .line 3345
    .line 3346
    invoke-direct {v6, v4, v7}, Lcom/oplus/melody/btsdk/protocol/commands/j;-><init>(II)V

    .line 3347
    .line 3348
    .line 3349
    invoke-static {v5, v6}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3350
    .line 3351
    .line 3352
    invoke-virtual {v0, v2, v3, v4}, Lcom/oplus/melody/btsdk/protocol/commands/A;->a(Ljava/lang/String;Lw8/a;I)V

    .line 3353
    .line 3354
    .line 3355
    goto :goto_d44

    .line 3356
    :cond_d1b
    const/4 v10, 0x1

    .line 3357
    const/4 v13, 0x0

    .line 3358
    new-array v4, v10, [B

    .line 3359
    .line 3360
    aput-byte v13, v4, v13

    .line 3361
    .line 3362
    iget-object v6, v0, Lcom/oplus/melody/btsdk/protocol/commands/A;->a:Lw8/b;

    .line 3363
    .line 3364
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 3365
    .line 3366
    .line 3367
    invoke-static {v3, v4}, Lw8/b;->b(Lw8/a;[B)Lw8/a;

    .line 3368
    .line 3369
    .line 3370
    move-result-object v4

    .line 3371
    iget-object v6, v0, Lcom/oplus/melody/btsdk/protocol/commands/A;->b:Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;

    .line 3372
    .line 3373
    invoke-virtual {v6, v2, v4}, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->z0(Ljava/lang/String;Lw8/a;)Z

    .line 3374
    .line 3375
    .line 3376
    const-string v4, "Receive free music command."

    .line 3377
    .line 3378
    invoke-static {v5, v4, v2}, LQ8/a;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3379
    .line 3380
    .line 3381
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/SimpleStateInfo;

    .line 3382
    .line 3383
    invoke-direct {v4, v2, v13}, Lcom/oplus/melody/btsdk/api/data/SimpleStateInfo;-><init>(Ljava/lang/String;I)V

    .line 3384
    .line 3385
    .line 3386
    iget-object v0, v0, Lcom/oplus/melody/btsdk/protocol/commands/A;->c:Landroid/os/Handler;

    .line 3387
    .line 3388
    move/from16 v5, v16

    .line 3389
    .line 3390
    invoke-virtual {v0, v5, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 3391
    .line 3392
    .line 3393
    move-result-object v0

    .line 3394
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 3395
    .line 3396
    .line 3397
    :goto_d44
    iget-object v0, v1, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->mNoGetStateSet:Ljava/util/Set;

    .line 3398
    .line 3399
    iget v4, v3, Lw8/a;->b:I

    .line 3400
    .line 3401
    and-int/lit16 v4, v4, 0xff

    .line 3402
    .line 3403
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3404
    .line 3405
    .line 3406
    move-result-object v4

    .line 3407
    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 3408
    .line 3409
    .line 3410
    move-result v0

    .line 3411
    if-nez v0, :cond_d93

    .line 3412
    .line 3413
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 3414
    .line 3415
    .line 3416
    move-result v0

    .line 3417
    if-nez v0, :cond_d8d

    .line 3418
    .line 3419
    const v0, 0x8403

    .line 3420
    .line 3421
    .line 3422
    iget v4, v3, Lw8/a;->a:I

    .line 3423
    .line 3424
    if-ne v4, v0, :cond_d82

    .line 3425
    .line 3426
    iget-object v0, v3, Lw8/a;->d:[B

    .line 3427
    .line 3428
    array-length v4, v0

    .line 3429
    if-nez v4, :cond_d6d

    .line 3430
    .line 3431
    const-string v0, "getFeatureSwitchStatus CMD_SWITCH_FEATURE_RSP data is empty"

    .line 3432
    .line 3433
    invoke-static {v14, v0}, LQ8/a;->m(Ljava/lang/String;Ljava/lang/String;)V

    .line 3434
    .line 3435
    .line 3436
    goto/16 :goto_dfb

    .line 3437
    .line 3438
    :cond_d6d
    const/16 v33, 0x0

    .line 3439
    .line 3440
    aget-byte v0, v0, v33

    .line 3441
    .line 3442
    new-instance v4, Lcom/oplus/melody/btsdk/protocol/commands/z;

    .line 3443
    .line 3444
    const/16 v7, 0x1c

    .line 3445
    .line 3446
    invoke-direct {v4, v0, v7}, Lcom/oplus/melody/btsdk/protocol/commands/z;-><init>(II)V

    .line 3447
    .line 3448
    .line 3449
    invoke-static {v14, v4}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3450
    .line 3451
    .line 3452
    if-nez v0, :cond_dfb

    .line 3453
    .line 3454
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->S(Ljava/lang/String;)V

    .line 3455
    .line 3456
    .line 3457
    goto/16 :goto_dfb

    .line 3458
    .line 3459
    :cond_d82
    new-instance v0, Lq8/a;

    .line 3460
    .line 3461
    const/4 v10, 0x1

    .line 3462
    invoke-direct {v0, v3, v10}, Lq8/a;-><init>(Lw8/a;I)V

    .line 3463
    .line 3464
    .line 3465
    invoke-static {v14, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3466
    .line 3467
    .line 3468
    goto/16 :goto_dfb

    .line 3469
    .line 3470
    :cond_d8d
    const-string v0, "getFeatureSwitchStatus address or packet is empty"

    .line 3471
    .line 3472
    invoke-static {v14, v0}, LQ8/a;->m(Ljava/lang/String;Ljava/lang/String;)V

    .line 3473
    .line 3474
    .line 3475
    goto :goto_dfb

    .line 3476
    :cond_d93
    iget-object v0, v1, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->mNoGetStateSet:Ljava/util/Set;

    .line 3477
    .line 3478
    iget v4, v3, Lw8/a;->b:I

    .line 3479
    .line 3480
    and-int/lit16 v4, v4, 0xff

    .line 3481
    .line 3482
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3483
    .line 3484
    .line 3485
    move-result-object v4

    .line 3486
    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 3487
    .line 3488
    .line 3489
    new-instance v0, Lnc/i;

    .line 3490
    .line 3491
    const/4 v10, 0x2

    .line 3492
    invoke-direct {v0, v10, v1, v3}, Lnc/i;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 3493
    .line 3494
    .line 3495
    invoke-static {v14, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 3496
    .line 3497
    .line 3498
    goto :goto_dfb

    .line 3499
    :cond_daa
    move/from16 v33, v5

    .line 3500
    .line 3501
    iget-object v0, v1, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->mZenModeManager:Lcom/oplus/melody/btsdk/protocol/upgrade/ZenModeOTAManager;

    .line 3502
    .line 3503
    if-nez v2, :cond_dbd

    .line 3504
    .line 3505
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 3506
    .line 3507
    .line 3508
    const-string v0, "ZenModeOTAManager"

    .line 3509
    .line 3510
    const-string v4, "macAddress is null when isUpgrading"

    .line 3511
    .line 3512
    invoke-static {v0, v4}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 3513
    .line 3514
    .line 3515
    :goto_dba
    move/from16 v5, v33

    .line 3516
    .line 3517
    goto :goto_dce

    .line 3518
    :cond_dbd
    iget-object v0, v0, Lcom/oplus/melody/btsdk/protocol/upgrade/ZenModeOTAManager;->e:Ljava/util/concurrent/ConcurrentHashMap;

    .line 3519
    .line 3520
    invoke-virtual {v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3521
    .line 3522
    .line 3523
    move-result-object v0

    .line 3524
    check-cast v0, Lcom/oplus/melody/btsdk/protocol/upgrade/ZenModeOTAManager$b;

    .line 3525
    .line 3526
    if-nez v0, :cond_dc8

    .line 3527
    .line 3528
    goto :goto_dba

    .line 3529
    :cond_dc8
    iget-object v0, v0, Lcom/oplus/melody/btsdk/protocol/upgrade/ZenModeOTAManager$b;->a:Ly8/a;

    .line 3530
    .line 3531
    invoke-virtual {v0}, Ly8/a;->d()Z

    .line 3532
    .line 3533
    .line 3534
    move-result v5

    .line 3535
    :goto_dce
    if-eqz v5, :cond_de0

    .line 3536
    .line 3537
    iget-object v0, v1, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->mZenModeManager:Lcom/oplus/melody/btsdk/protocol/upgrade/ZenModeOTAManager;

    .line 3538
    .line 3539
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 3540
    .line 3541
    .line 3542
    new-instance v4, Landroid/util/Pair;

    .line 3543
    .line 3544
    invoke-direct {v4, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3545
    .line 3546
    .line 3547
    const/4 v5, 0x4

    .line 3548
    const/4 v6, -0x1

    .line 3549
    invoke-virtual {v0, v5, v6, v4}, Lcom/oplus/melody/btsdk/protocol/upgrade/ZenModeOTAManager;->a(IILjava/lang/Object;)V

    .line 3550
    .line 3551
    .line 3552
    goto :goto_dfb

    .line 3553
    :cond_de0
    const/4 v6, -0x1

    .line 3554
    iget-object v0, v1, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->mUpgradeManager:Lcom/oplus/melody/btsdk/protocol/upgrade/UpgradeManager;

    .line 3555
    .line 3556
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 3557
    .line 3558
    .line 3559
    invoke-static/range {p1 .. p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 3560
    .line 3561
    .line 3562
    move-result-object v4

    .line 3563
    const/16 v5, 0x8

    .line 3564
    .line 3565
    invoke-virtual {v0, v5, v6, v4}, Lcom/oplus/melody/btsdk/protocol/upgrade/UpgradeManager;->f(IILjava/lang/Object;)V

    .line 3566
    .line 3567
    .line 3568
    goto :goto_dfb

    .line 3569
    :cond_df0
    iget-object v0, v1, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->mNotificationCommandManager:Lcom/oplus/melody/btsdk/protocol/commands/i;

    .line 3570
    .line 3571
    invoke-virtual {v0, v2, v3}, Lcom/oplus/melody/btsdk/protocol/commands/i;->c(Ljava/lang/String;Lw8/a;)V

    .line 3572
    .line 3573
    .line 3574
    goto :goto_dfb

    .line 3575
    :cond_df6
    iget-object v0, v1, Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;->mPollCommandManager:Lcom/oplus/melody/btsdk/protocol/commands/m;

    .line 3576
    .line 3577
    invoke-virtual {v0, v2, v3}, Lcom/oplus/melody/btsdk/protocol/commands/m;->M(Ljava/lang/String;Lw8/a;)V

    .line 3578
    .line 3579
    .line 3580
    :cond_dfb
    :goto_dfb
    new-instance v0, LIc/s;

    .line 3581
    .line 3582
    const/16 v5, 0x9

    .line 3583
    .line 3584
    invoke-direct {v0, v1, v5}, LIc/s;-><init>(Ljava/lang/Object;I)V

    .line 3585
    .line 3586
    .line 3587
    invoke-static {v2, v9, v3, v1, v0}, Lv8/a;->a(Ljava/lang/String;ILw8/a;Lcom/oplus/melody/btsdk/multidevice/HeadsetCoreService;LIc/s;)V

    .line 3588
    .line 3589
    .line 3590
    return-void

    :sswitch_data_e06
    .sparse-switch
        0xf01 -> :sswitch_21e
        0xf02 -> :sswitch_1eb
        0xf05 -> :sswitch_184
        0x8f00 -> :sswitch_145
        0x8f03 -> :sswitch_f2
        0x8f04 -> :sswitch_b9
    .end sparse-switch

    :pswitch_data_e20
    .packed-switch 0x500
        :pswitch_9dd
        :pswitch_9c6
        :pswitch_9aa
        :pswitch_965
        :pswitch_941
        :pswitch_904
        :pswitch_8cf
        :pswitch_8a8
        :pswitch_86e
        :pswitch_7d3
        :pswitch_589
        :pswitch_2e0
        :pswitch_553
        :pswitch_2e0
        :pswitch_2e0
        :pswitch_52b
        :pswitch_507
        :pswitch_2e0
        :pswitch_2e0
        :pswitch_4d7
        :pswitch_499
        :pswitch_2e0
        :pswitch_45d
        :pswitch_404
        :pswitch_3c2
        :pswitch_3ad
        :pswitch_36d
        :pswitch_2e0
        :pswitch_328
        :pswitch_2e2
    .end packed-switch

    :pswitch_data_e60
    .packed-switch 0x8400
        :pswitch_d01
        :pswitch_ce7
    .end packed-switch

    :pswitch_data_e68
    .packed-switch 0x8403
        :pswitch_ccd
        :pswitch_cb4
        :pswitch_c99
        :pswitch_c7d
    .end packed-switch

    :pswitch_data_e74
    .packed-switch 0x840d
        :pswitch_c62
        :pswitch_c62
        :pswitch_c62
        :pswitch_c46
        :pswitch_c62
        :pswitch_c62
        :pswitch_c62
        :pswitch_c2e
        :pswitch_c62
    .end packed-switch

    :pswitch_data_e8a
    .packed-switch 0x8417
        :pswitch_c14
        :pswitch_bf5
        :pswitch_bf2
        :pswitch_bdc
        :pswitch_bc6
        :pswitch_ba9
        :pswitch_b8c
        :pswitch_bf2
        :pswitch_b7b
        :pswitch_bf2
        :pswitch_bf2
        :pswitch_bf2
        :pswitch_bf2
        :pswitch_bf2
        :pswitch_bf2
        :pswitch_bf2
        :pswitch_bf2
        :pswitch_bf2
        :pswitch_bf2
    .end packed-switch

    :pswitch_data_eb4
    .packed-switch 0x842b
        :pswitch_b4b
        :pswitch_c62
        :pswitch_c62
        :pswitch_c62
    .end packed-switch

    :pswitch_data_ec0
    .packed-switch 0x8430
        :pswitch_c62
        :pswitch_b27
        :pswitch_b03
        :pswitch_ae7
        :pswitch_acb
        :pswitch_aa8
    .end packed-switch
.end method
