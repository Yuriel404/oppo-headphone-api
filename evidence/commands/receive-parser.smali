.method public final M(Ljava/lang/String;Lw8/a;)V
    .registers 30

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v0, p2

    .line 6
    .line 7
    const/16 v8, 0xb

    .line 8
    .line 9
    const-string v14, "PollCommandManager"

    .line 10
    .line 11
    iget-object v15, v1, Lcom/oplus/melody/btsdk/protocol/commands/m;->d:Landroid/os/Handler;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    const/16 v18, 0x6

    .line 15
    .line 16
    const/16 v19, 0x7

    .line 17
    .line 18
    const/16 v20, 0x4

    .line 19
    .line 20
    const/4 v11, 0x1

    .line 21
    const-string v12, "parseAccountKey accountKey  offset:2 len:"

    .line 22
    .line 23
    iget v10, v0, Lw8/a;->a:I

    .line 24
    .line 25
    const-string v5, "Status is failed when receive codec type command. status = "

    .line 26
    .line 27
    const-string v6, "CommandUtil"

    .line 28
    .line 29
    const-string v13, ""

    .line 30
    .line 31
    const-string v7, "The length of data is 1, not valid when receive volume value info."

    .line 32
    .line 33
    const-string v4, "Status is failed when receive remote volume value info command. status = "

    .line 34
    .line 35
    const/16 v23, 0x0

    .line 36
    .line 37
    iget-object v9, v0, Lw8/a;->d:[B

    .line 38
    .line 39
    packed-switch v10, :pswitch_data_c70

    .line 40
    .line 41
    .line 42
    :pswitch_29
    goto/16 :goto_8c9

    .line 43
    .line 44
    :pswitch_2b
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    new-instance v3, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v4, "handleReceiveLeBrSwitchStateInfo, data: 0x"

    .line 51
    .line 52
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v9}, LWa/a;->g([B)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-static {v14, v3, v2}, LQ8/a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    if-eqz v0, :cond_4c

    .line 70
    .line 71
    const-string v2, "handleReceiveLeBrSwitchStateInfo failed, status = "

    .line 72
    .line 73
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_4c
    if-eqz v9, :cond_6d

    .line 78
    .line 79
    array-length v0, v9

    .line 80
    if-gt v0, v11, :cond_52

    .line 81
    .line 82
    goto :goto_6d

    .line 83
    :cond_52
    invoke-static {v11, v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->k(I[B)Lcom/oplus/melody/btsdk/api/data/LeBrSwitchStateInfo;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v3, La8/c;

    .line 88
    .line 89
    invoke-direct {v3, v0, v8}, La8/c;-><init>(Ljava/lang/Object;I)V

    .line 90
    .line 91
    .line 92
    invoke-static {v14, v3, v2}, LQ8/a;->d(Ljava/lang/String;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    new-instance v3, Landroid/util/Pair;

    .line 96
    .line 97
    invoke-direct {v3, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    const/16 v0, 0x5c

    .line 101
    .line 102
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_6d
    :goto_6d
    const-string v0, "handleReceiveLeBrSwitchStateInfo: invalid length"

    .line 111
    .line 112
    invoke-static {v14, v0}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :pswitch_73
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_7f

    .line 121
    .line 122
    const-string v2, "Status is failed when receive gmn config. status = "

    .line 123
    .line 124
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_7f
    new-instance v0, Lcom/oplus/melody/btsdk/protocol/commands/l;

    .line 129
    .line 130
    invoke-direct {v0, v9, v3}, Lcom/oplus/melody/btsdk/protocol/commands/l;-><init>([BI)V

    .line 131
    .line 132
    .line 133
    invoke-static {v14, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 134
    .line 135
    .line 136
    invoke-static {v2, v11, v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->j(Ljava/lang/String;I[B)Lcom/oplus/melody/btsdk/api/data/GmnVoiceAssistConfig;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    new-instance v3, Landroid/util/Pair;

    .line 141
    .line 142
    invoke-direct {v3, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    const/16 v0, 0x5b

    .line 146
    .line 147
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :pswitch_9a
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_a6

    .line 160
    .line 161
    const-string v2, "Status is failed when receive head motion type. status = "

    .line 162
    .line 163
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_a6
    array-length v0, v9

    .line 168
    if-gt v0, v11, :cond_af

    .line 169
    .line 170
    const-string v0, "The length of data is 1, not valid when receive head motion type."

    .line 171
    .line 172
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_af
    new-instance v0, Lcom/oplus/melody/btsdk/protocol/commands/a;

    .line 177
    .line 178
    const/4 v3, 0x2

    .line 179
    invoke-direct {v0, v9, v3}, Lcom/oplus/melody/btsdk/protocol/commands/a;-><init>([BI)V

    .line 180
    .line 181
    .line 182
    invoke-static {v14, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 183
    .line 184
    .line 185
    array-length v0, v9

    .line 186
    if-gt v0, v11, :cond_c2

    .line 187
    .line 188
    const-string v0, "The length of data is not valid when parse head motion type"

    .line 189
    .line 190
    invoke-static {v6, v0}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    const/4 v13, -0x1

    .line 194
    goto :goto_c6

    .line 195
    :cond_c2
    invoke-static {v9, v11, v11, v11}, Ln7/d;->d([BIIZ)I

    .line 196
    .line 197
    .line 198
    move-result v13

    .line 199
    :goto_c6
    new-instance v0, Landroid/util/Pair;

    .line 200
    .line 201
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    invoke-direct {v0, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    const/16 v2, 0x59

    .line 209
    .line 210
    invoke-virtual {v15, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :pswitch_d9
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-eqz v0, :cond_e5

    .line 223
    .line 224
    const-string v2, "Status is failed when receive remote tap level setting value info command. status = "

    .line 225
    .line 226
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :cond_e5
    array-length v0, v9

    .line 231
    if-gt v0, v11, :cond_ee

    .line 232
    .line 233
    const-string v0, "The length of data is 1, not valid when receive tap level setting value info."

    .line 234
    .line 235
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    return-void

    .line 239
    :cond_ee
    array-length v0, v9

    .line 240
    const/4 v4, 0x3

    .line 241
    if-ge v0, v4, :cond_fa

    .line 242
    .line 243
    const-string v0, "The length of data is not valid when parse tapLevelSettingInfo"

    .line 244
    .line 245
    invoke-static {v6, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    move-object/from16 v0, v23

    .line 249
    .line 250
    goto :goto_ff

    .line 251
    :cond_fa
    new-instance v0, Lcom/oplus/melody/btsdk/protocol/commands/TapLevelSettingInfo;

    .line 252
    .line 253
    invoke-direct {v0, v11, v9, v3}, Lcom/oplus/melody/btsdk/protocol/commands/TapLevelSettingInfo;-><init>(I[BZ)V

    .line 254
    .line 255
    .line 256
    :goto_ff
    if-nez v0, :cond_103

    .line 257
    .line 258
    goto/16 :goto_8c9

    .line 259
    .line 260
    :cond_103
    new-instance v3, Landroid/util/Pair;

    .line 261
    .line 262
    invoke-direct {v3, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    new-instance v2, La8/c;

    .line 266
    .line 267
    const/16 v4, 0xc

    .line 268
    .line 269
    invoke-direct {v2, v0, v4}, La8/c;-><init>(Ljava/lang/Object;I)V

    .line 270
    .line 271
    .line 272
    invoke-static {v14, v2}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 273
    .line 274
    .line 275
    const/16 v0, 0x56

    .line 276
    .line 277
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 282
    .line 283
    .line 284
    return-void

    .line 285
    :pswitch_11c
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    if-eqz v0, :cond_128

    .line 290
    .line 291
    const-string v2, "handleRecvMultiConnectPriorityDevice, Status is failed! status = "

    .line 292
    .line 293
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :cond_128
    array-length v0, v9

    .line 298
    if-gt v0, v11, :cond_131

    .line 299
    .line 300
    const-string v0, "handleRecvMultiConnectPriorityDevice The length of data is 1!"

    .line 301
    .line 302
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    return-void

    .line 306
    :cond_131
    new-instance v0, Lcom/oplus/melody/btsdk/api/data/HandheldDeviceInfo;

    .line 307
    .line 308
    invoke-direct {v0, v2, v11, v9}, Lcom/oplus/melody/btsdk/api/data/HandheldDeviceInfo;-><init>(Ljava/lang/String;I[B)V

    .line 309
    .line 310
    .line 311
    new-instance v3, Landroid/util/Pair;

    .line 312
    .line 313
    invoke-direct {v3, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 314
    .line 315
    .line 316
    const/16 v0, 0x4f

    .line 317
    .line 318
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 323
    .line 324
    .line 325
    return-void

    .line 326
    :pswitch_145
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 327
    .line 328
    .line 329
    move-result v0

    .line 330
    if-eqz v0, :cond_14f

    .line 331
    .line 332
    invoke-static {v0, v4, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 333
    .line 334
    .line 335
    return-void

    .line 336
    :cond_14f
    array-length v0, v9

    .line 337
    if-gt v0, v11, :cond_156

    .line 338
    .line 339
    invoke-static {v14, v7}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    return-void

    .line 343
    :cond_156
    aget-byte v0, v9, v11

    .line 344
    .line 345
    new-instance v3, Landroid/util/Pair;

    .line 346
    .line 347
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 348
    .line 349
    .line 350
    move-result-object v4

    .line 351
    invoke-direct {v3, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 352
    .line 353
    .line 354
    new-instance v2, LA9/l;

    .line 355
    .line 356
    const/16 v4, 0x15

    .line 357
    .line 358
    invoke-direct {v2, v0, v4}, LA9/l;-><init>(II)V

    .line 359
    .line 360
    .line 361
    invoke-static {v14, v2}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 362
    .line 363
    .line 364
    const/16 v0, 0x55

    .line 365
    .line 366
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 367
    .line 368
    .line 369
    move-result-object v0

    .line 370
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 371
    .line 372
    .line 373
    return-void

    .line 374
    :pswitch_175
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 375
    .line 376
    .line 377
    move-result v0

    .line 378
    if-eqz v0, :cond_17f

    .line 379
    .line 380
    invoke-static {v0, v4, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    return-void

    .line 384
    :cond_17f
    array-length v0, v9

    .line 385
    if-gt v0, v11, :cond_186

    .line 386
    .line 387
    invoke-static {v14, v7}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    return-void

    .line 391
    :cond_186
    aget-byte v0, v9, v11

    .line 392
    .line 393
    new-instance v3, Landroid/util/Pair;

    .line 394
    .line 395
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 396
    .line 397
    .line 398
    move-result-object v4

    .line 399
    invoke-direct {v3, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 400
    .line 401
    .line 402
    new-instance v2, LAb/r0;

    .line 403
    .line 404
    const/16 v4, 0x1c

    .line 405
    .line 406
    invoke-direct {v2, v0, v4}, LAb/r0;-><init>(II)V

    .line 407
    .line 408
    .line 409
    invoke-static {v14, v2}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 410
    .line 411
    .line 412
    const/16 v0, 0x4e

    .line 413
    .line 414
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 419
    .line 420
    .line 421
    return-void

    .line 422
    :pswitch_1a5
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 423
    .line 424
    .line 425
    move-result v0

    .line 426
    if-eqz v0, :cond_1b1

    .line 427
    .line 428
    const-string v2, "Status is failed when receive remote AISummary type command. status = "

    .line 429
    .line 430
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 431
    .line 432
    .line 433
    return-void

    .line 434
    :cond_1b1
    array-length v0, v9

    .line 435
    if-gt v0, v11, :cond_1ba

    .line 436
    .line 437
    const-string v0, "The length of data is 1, not valid when receive AISummary type."

    .line 438
    .line 439
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 440
    .line 441
    .line 442
    return-void

    .line 443
    :cond_1ba
    aget-byte v0, v9, v11

    .line 444
    .line 445
    new-instance v3, Landroid/util/Pair;

    .line 446
    .line 447
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 448
    .line 449
    .line 450
    move-result-object v4

    .line 451
    invoke-direct {v3, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 452
    .line 453
    .line 454
    new-instance v2, LAb/F;

    .line 455
    .line 456
    const/16 v4, 0x19

    .line 457
    .line 458
    invoke-direct {v2, v0, v4}, LAb/F;-><init>(II)V

    .line 459
    .line 460
    .line 461
    invoke-static {v14, v2}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 462
    .line 463
    .line 464
    const/16 v0, 0x4d

    .line 465
    .line 466
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 471
    .line 472
    .line 473
    return-void

    .line 474
    :pswitch_1d9
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 475
    .line 476
    .line 477
    move-result v0

    .line 478
    if-eqz v0, :cond_1e5

    .line 479
    .line 480
    const-string v2, "handleReceiveGameSoundInfo. status = "

    .line 481
    .line 482
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 483
    .line 484
    .line 485
    return-void

    .line 486
    :cond_1e5
    array-length v0, v9

    .line 487
    if-gt v0, v11, :cond_1ee

    .line 488
    .line 489
    const-string v0, "handleReceiveGameSoundInfo len error"

    .line 490
    .line 491
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 492
    .line 493
    .line 494
    return-void

    .line 495
    :cond_1ee
    new-instance v0, Lcom/oplus/melody/btsdk/api/data/GameSoundInfo;

    .line 496
    .line 497
    invoke-direct {v0}, Lcom/oplus/melody/btsdk/api/data/GameSoundInfo;-><init>()V

    .line 498
    .line 499
    .line 500
    aget-byte v4, v9, v11

    .line 501
    .line 502
    invoke-virtual {v0, v4}, Lcom/oplus/melody/btsdk/api/data/GameSoundInfo;->setSelectType(I)V

    .line 503
    .line 504
    .line 505
    const/16 v24, 0x2

    .line 506
    .line 507
    aget-byte v4, v9, v24

    .line 508
    .line 509
    new-array v5, v4, [I

    .line 510
    .line 511
    const/4 v7, 0x3

    .line 512
    :goto_1ff
    array-length v8, v9

    .line 513
    if-ge v7, v8, :cond_20f

    .line 514
    .line 515
    if-ge v3, v4, :cond_20f

    .line 516
    .line 517
    add-int/lit8 v8, v3, 0x1

    .line 518
    .line 519
    add-int/lit8 v10, v7, 0x1

    .line 520
    .line 521
    aget-byte v7, v9, v7

    .line 522
    .line 523
    aput v7, v5, v3

    .line 524
    .line 525
    move v3, v8

    .line 526
    move v7, v10

    .line 527
    goto :goto_1ff

    .line 528
    :cond_20f
    if-eq v3, v4, :cond_216

    .line 529
    .line 530
    const-string v3, "parseGameSoundData len error"

    .line 531
    .line 532
    invoke-static {v6, v3}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 533
    .line 534
    .line 535
    :cond_216
    invoke-virtual {v0, v5}, Lcom/oplus/melody/btsdk/api/data/GameSoundInfo;->setSupportTypes([I)V

    .line 536
    .line 537
    .line 538
    new-instance v3, LKb/i;

    .line 539
    .line 540
    const/4 v4, 0x2

    .line 541
    invoke-direct {v3, v0, v4}, LKb/i;-><init>(Lcom/oplus/melody/btsdk/api/data/GameSoundInfo;I)V

    .line 542
    .line 543
    .line 544
    invoke-static {v6, v3}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 545
    .line 546
    .line 547
    new-instance v3, Landroid/util/Pair;

    .line 548
    .line 549
    invoke-direct {v3, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 550
    .line 551
    .line 552
    const/16 v0, 0x48

    .line 553
    .line 554
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 555
    .line 556
    .line 557
    move-result-object v0

    .line 558
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 559
    .line 560
    .line 561
    return-void

    .line 562
    :pswitch_231
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 563
    .line 564
    .line 565
    move-result v0

    .line 566
    if-eqz v0, :cond_23d

    .line 567
    .line 568
    const-string v2, "handleRecvHeadSetSpatialType, Status is failed. status = "

    .line 569
    .line 570
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 571
    .line 572
    .line 573
    return-void

    .line 574
    :cond_23d
    array-length v0, v9

    .line 575
    if-gt v0, v11, :cond_246

    .line 576
    .line 577
    const-string v0, "handleRecvHeadSetSpatialType, The data.length invalid"

    .line 578
    .line 579
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 580
    .line 581
    .line 582
    return-void

    .line 583
    :cond_246
    aget-byte v0, v9, v11

    .line 584
    .line 585
    new-instance v3, Landroid/util/Pair;

    .line 586
    .line 587
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 588
    .line 589
    .line 590
    move-result-object v4

    .line 591
    invoke-direct {v3, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 592
    .line 593
    .line 594
    new-instance v2, LAb/r0;

    .line 595
    .line 596
    const/16 v4, 0x1b

    .line 597
    .line 598
    invoke-direct {v2, v0, v4}, LAb/r0;-><init>(II)V

    .line 599
    .line 600
    .line 601
    invoke-static {v14, v2}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 602
    .line 603
    .line 604
    const/16 v0, 0x46

    .line 605
    .line 606
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 607
    .line 608
    .line 609
    move-result-object v0

    .line 610
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 611
    .line 612
    .line 613
    return-void

    .line 614
    :pswitch_265
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 615
    .line 616
    .line 617
    move-result v0

    .line 618
    if-eqz v0, :cond_271

    .line 619
    .line 620
    const-string v2, "handleRecvCalibratedState, Status is failed. status = "

    .line 621
    .line 622
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 623
    .line 624
    .line 625
    return-void

    .line 626
    :cond_271
    array-length v0, v9

    .line 627
    if-gt v0, v11, :cond_27a

    .line 628
    .line 629
    const-string v0, "handleRecvCalibratedState, The data.length invalid"

    .line 630
    .line 631
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 632
    .line 633
    .line 634
    return-void

    .line 635
    :cond_27a
    aget-byte v0, v9, v11

    .line 636
    .line 637
    new-instance v3, Landroid/util/Pair;

    .line 638
    .line 639
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 640
    .line 641
    .line 642
    move-result-object v4

    .line 643
    invoke-direct {v3, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 644
    .line 645
    .line 646
    new-instance v2, LAb/F;

    .line 647
    .line 648
    const/16 v4, 0x18

    .line 649
    .line 650
    invoke-direct {v2, v0, v4}, LAb/F;-><init>(II)V

    .line 651
    .line 652
    .line 653
    invoke-static {v14, v2}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 654
    .line 655
    .line 656
    const/16 v0, 0x45

    .line 657
    .line 658
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 659
    .line 660
    .line 661
    move-result-object v0

    .line 662
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 663
    .line 664
    .line 665
    return-void

    .line 666
    :pswitch_299
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 667
    .line 668
    .line 669
    move-result v0

    .line 670
    if-eqz v0, :cond_2a5

    .line 671
    .line 672
    const-string v2, "Status is failed when receive screen off broadcast delay time. status = "

    .line 673
    .line 674
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 675
    .line 676
    .line 677
    return-void

    .line 678
    :cond_2a5
    array-length v0, v9

    .line 679
    if-gtz v0, :cond_2ae

    .line 680
    .line 681
    const-string v0, "The length of data is 1, not valid when receive screen off broadcast delay time."

    .line 682
    .line 683
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 684
    .line 685
    .line 686
    return-void

    .line 687
    :cond_2ae
    array-length v0, v9

    .line 688
    if-gt v0, v11, :cond_2b8

    .line 689
    .line 690
    const-string v0, "The length of data is not valid when parseScreenOffBroadcastDelayTime"

    .line 691
    .line 692
    invoke-static {v6, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 693
    .line 694
    .line 695
    const/4 v13, -0x1

    .line 696
    goto :goto_2ba

    .line 697
    :cond_2b8
    aget-byte v13, v9, v11

    .line 698
    .line 699
    :goto_2ba
    new-instance v0, Landroid/util/Pair;

    .line 700
    .line 701
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 702
    .line 703
    .line 704
    move-result-object v3

    .line 705
    invoke-direct {v0, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 706
    .line 707
    .line 708
    const/16 v2, 0x3e

    .line 709
    .line 710
    invoke-virtual {v15, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 711
    .line 712
    .line 713
    move-result-object v0

    .line 714
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 715
    .line 716
    .line 717
    return-void

    .line 718
    :pswitch_2cd
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 719
    .line 720
    .line 721
    move-result v0

    .line 722
    if-eqz v0, :cond_2da

    .line 723
    .line 724
    const-string v2, "Status is failed when receive accountkey. status = "

    .line 725
    .line 726
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 727
    .line 728
    .line 729
    goto/16 :goto_8c9

    .line 730
    .line 731
    :cond_2da
    array-length v0, v9

    .line 732
    if-gtz v0, :cond_2e4

    .line 733
    .line 734
    const-string v0, "The length of data is 1, not valid when receive accountkey."

    .line 735
    .line 736
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 737
    .line 738
    .line 739
    goto/16 :goto_8c9

    .line 740
    .line 741
    :cond_2e4
    array-length v0, v9

    .line 742
    if-gt v0, v11, :cond_2ed

    .line 743
    .line 744
    const-string v0, "The length of data is not valid when parse accountkey"

    .line 745
    .line 746
    invoke-static {v6, v0}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 747
    .line 748
    .line 749
    goto :goto_33e

    .line 750
    :cond_2ed
    aget-byte v0, v9, v11

    .line 751
    .line 752
    and-int/lit16 v0, v0, 0xff

    .line 753
    .line 754
    if-gtz v0, :cond_2f4

    .line 755
    .line 756
    goto :goto_33e

    .line 757
    :cond_2f4
    const/4 v4, 0x2

    .line 758
    :try_start_2f5
    invoke-static {v9, v4, v11, v11}, Ln7/d;->d([BIIZ)I

    .line 759
    .line 760
    .line 761
    move-result v0

    .line 762
    add-int/2addr v4, v0

    .line 763
    array-length v5, v9

    .line 764
    if-le v4, v5, :cond_31c

    .line 765
    .line 766
    new-instance v0, Ljava/lang/StringBuilder;

    .line 767
    .line 768
    invoke-direct {v0, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 769
    .line 770
    .line 771
    array-length v3, v9

    .line 772
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 773
    .line 774
    .line 775
    const-string v3, " data:"

    .line 776
    .line 777
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 778
    .line 779
    .line 780
    invoke-static {v9}, LWa/a;->g([B)Ljava/lang/String;

    .line 781
    .line 782
    .line 783
    move-result-object v3

    .line 784
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 785
    .line 786
    .line 787
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 788
    .line 789
    .line 790
    move-result-object v0

    .line 791
    invoke-static {v6, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 792
    .line 793
    .line 794
    goto :goto_33e

    .line 795
    :catch_31a
    move-exception v0

    .line 796
    goto :goto_329

    .line 797
    :cond_31c
    if-lez v0, :cond_33e

    .line 798
    .line 799
    new-array v4, v0, [B

    .line 800
    .line 801
    const/4 v5, 0x3

    .line 802
    invoke-static {v9, v5, v4, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 803
    .line 804
    .line 805
    invoke-static {v4}, LWa/a;->g([B)Ljava/lang/String;

    .line 806
    .line 807
    .line 808
    move-result-object v13
    :try_end_328
    .catch Ljava/lang/Exception; {:try_start_2f5 .. :try_end_328} :catch_31a

    .line 809
    goto :goto_33e

    .line 810
    :goto_329
    new-instance v3, Ljava/lang/StringBuilder;

    .line 811
    .line 812
    const-string v4, "parseAccountKey throws Exception:"

    .line 813
    .line 814
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 815
    .line 816
    .line 817
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 818
    .line 819
    .line 820
    move-result-object v0

    .line 821
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 822
    .line 823
    .line 824
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 825
    .line 826
    .line 827
    move-result-object v0

    .line 828
    invoke-static {v6, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 829
    .line 830
    .line 831
    :cond_33e
    :goto_33e
    new-instance v0, Landroid/util/Pair;

    .line 832
    .line 833
    invoke-direct {v0, v2, v13}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 834
    .line 835
    .line 836
    const/16 v2, 0x3b

    .line 837
    .line 838
    invoke-virtual {v15, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 839
    .line 840
    .line 841
    move-result-object v0

    .line 842
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 843
    .line 844
    .line 845
    goto/16 :goto_8c9

    .line 846
    .line 847
    :pswitch_34e
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 848
    .line 849
    .line 850
    move-result v0

    .line 851
    if-eqz v0, :cond_35a

    .line 852
    .line 853
    const-string v2, "Status is failed when receive bass engine command. status = "

    .line 854
    .line 855
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 856
    .line 857
    .line 858
    return-void

    .line 859
    :cond_35a
    array-length v0, v9

    .line 860
    if-gt v0, v11, :cond_370

    .line 861
    .line 862
    new-instance v0, Ljava/lang/StringBuilder;

    .line 863
    .line 864
    const-string v3, "handleReceiveBassEngineResult\uff1ainvalid data length "

    .line 865
    .line 866
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 867
    .line 868
    .line 869
    array-length v3, v9

    .line 870
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 871
    .line 872
    .line 873
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 874
    .line 875
    .line 876
    move-result-object v0

    .line 877
    invoke-static {v14, v0, v2}, LQ8/a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 878
    .line 879
    .line 880
    return-void

    .line 881
    :cond_370
    invoke-static {v11, v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->c(I[B)Lcom/oplus/melody/btsdk/api/data/BassEngineInfo;

    .line 882
    .line 883
    .line 884
    move-result-object v0

    .line 885
    new-instance v3, LX7/b;

    .line 886
    .line 887
    const/16 v4, 0xe

    .line 888
    .line 889
    invoke-direct {v3, v0, v4}, LX7/b;-><init>(Ljava/lang/Object;I)V

    .line 890
    .line 891
    .line 892
    invoke-static {v14, v3, v2}, LQ8/a;->d(Ljava/lang/String;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 893
    .line 894
    .line 895
    new-instance v3, Landroid/util/Pair;

    .line 896
    .line 897
    invoke-direct {v3, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 898
    .line 899
    .line 900
    const/16 v0, 0x39

    .line 901
    .line 902
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 903
    .line 904
    .line 905
    move-result-object v0

    .line 906
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 907
    .line 908
    .line 909
    return-void

    .line 910
    :pswitch_38d
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 911
    .line 912
    .line 913
    move-result v0

    .line 914
    if-eqz v0, :cond_397

    .line 915
    .line 916
    invoke-static {v0, v5, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 917
    .line 918
    .line 919
    return-void

    .line 920
    :cond_397
    array-length v0, v9

    .line 921
    if-gt v0, v11, :cond_3ad

    .line 922
    .line 923
    new-instance v0, Ljava/lang/StringBuilder;

    .line 924
    .line 925
    const-string v3, "handleReceiveCodecList\uff1ainvalid data length "

    .line 926
    .line 927
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 928
    .line 929
    .line 930
    array-length v3, v9

    .line 931
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 932
    .line 933
    .line 934
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 935
    .line 936
    .line 937
    move-result-object v0

    .line 938
    invoke-static {v14, v0, v2}, LQ8/a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 939
    .line 940
    .line 941
    return-void

    .line 942
    :cond_3ad
    new-instance v0, Ljava/util/ArrayList;

    .line 943
    .line 944
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 945
    .line 946
    .line 947
    array-length v4, v9

    .line 948
    const/4 v5, 0x3

    .line 949
    if-ge v4, v5, :cond_3bc

    .line 950
    .line 951
    const-string v3, "The length of data is not valid when parse codecList"

    .line 952
    .line 953
    invoke-static {v6, v3}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 954
    .line 955
    .line 956
    goto :goto_407

    .line 957
    :cond_3bc
    const/16 v4, 0x8

    .line 958
    .line 959
    new-array v5, v4, [I

    .line 960
    .line 961
    fill-array-data v5, :array_ce2

    .line 962
    .line 963
    .line 964
    invoke-static {v11, v9}, LWa/a;->h(I[B)I

    .line 965
    .line 966
    .line 967
    move-result v7

    .line 968
    new-instance v8, LAb/S;

    .line 969
    .line 970
    const/16 v9, 0x1c

    .line 971
    .line 972
    invoke-direct {v8, v7, v9}, LAb/S;-><init>(II)V

    .line 973
    .line 974
    .line 975
    invoke-static {v6, v8}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 976
    .line 977
    .line 978
    :goto_3d1
    if-ge v3, v4, :cond_3e5

    .line 979
    .line 980
    shl-int v4, v11, v3

    .line 981
    .line 982
    and-int/2addr v4, v7

    .line 983
    if-eqz v4, :cond_3e1

    .line 984
    .line 985
    aget v4, v5, v3

    .line 986
    .line 987
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 988
    .line 989
    .line 990
    move-result-object v4

    .line 991
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 992
    .line 993
    .line 994
    :cond_3e1
    add-int/2addr v3, v11

    .line 995
    const/16 v4, 0x8

    .line 996
    .line 997
    goto :goto_3d1

    .line 998
    :cond_3e5
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 999
    .line 1000
    .line 1001
    move-result-object v3

    .line 1002
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 1003
    .line 1004
    .line 1005
    move-result v3

    .line 1006
    if-eqz v3, :cond_407

    .line 1007
    .line 1008
    const/16 v21, 0x8

    .line 1009
    .line 1010
    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1011
    .line 1012
    .line 1013
    move-result-object v3

    .line 1014
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 1015
    .line 1016
    .line 1017
    move-result v3

    .line 1018
    if-eqz v3, :cond_407

    .line 1019
    .line 1020
    const-string v3, "remove LHDC"

    .line 1021
    .line 1022
    invoke-static {v6, v3}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 1023
    .line 1024
    .line 1025
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1026
    .line 1027
    .line 1028
    move-result-object v3

    .line 1029
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1030
    .line 1031
    .line 1032
    :cond_407
    :goto_407
    new-instance v3, LFa/C;

    .line 1033
    .line 1034
    const/4 v4, 0x5

    .line 1035
    invoke-direct {v3, v0, v4}, LFa/C;-><init>(Ljava/util/ArrayList;I)V

    .line 1036
    .line 1037
    .line 1038
    invoke-static {v14, v3, v2}, LQ8/a;->d(Ljava/lang/String;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 1039
    .line 1040
    .line 1041
    new-instance v3, Landroid/util/Pair;

    .line 1042
    .line 1043
    invoke-direct {v3, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1044
    .line 1045
    .line 1046
    const/16 v0, 0x38

    .line 1047
    .line 1048
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1049
    .line 1050
    .line 1051
    move-result-object v0

    .line 1052
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1053
    .line 1054
    .line 1055
    return-void

    .line 1056
    :pswitch_41f
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 1057
    .line 1058
    .line 1059
    move-result v0

    .line 1060
    if-eqz v0, :cond_42b

    .line 1061
    .line 1062
    const-string v2, "Status is failed when receive remote all eq data command. status = "

    .line 1063
    .line 1064
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 1065
    .line 1066
    .line 1067
    return-void

    .line 1068
    :cond_42b
    array-length v0, v9

    .line 1069
    if-gt v0, v11, :cond_434

    .line 1070
    .line 1071
    const-string v0, "The length of data is 1, not valid when receive all eq info"

    .line 1072
    .line 1073
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1074
    .line 1075
    .line 1076
    return-void

    .line 1077
    :cond_434
    invoke-static {v11, v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->b(I[B)Ljava/util/List;

    .line 1078
    .line 1079
    .line 1080
    move-result-object v0

    .line 1081
    if-nez v0, :cond_440

    .line 1082
    .line 1083
    const-string v0, "Error when parse all eq info from the packet. eqInfoList is null!"

    .line 1084
    .line 1085
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1086
    .line 1087
    .line 1088
    return-void

    .line 1089
    :cond_440
    new-instance v3, Landroid/util/Pair;

    .line 1090
    .line 1091
    invoke-direct {v3, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1092
    .line 1093
    .line 1094
    const/16 v0, 0x36

    .line 1095
    .line 1096
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1097
    .line 1098
    .line 1099
    move-result-object v0

    .line 1100
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1101
    .line 1102
    .line 1103
    return-void

    .line 1104
    :pswitch_44f
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 1105
    .line 1106
    .line 1107
    move-result v0

    .line 1108
    if-eqz v0, :cond_45b

    .line 1109
    .line 1110
    const-string v2, "handleRecvEarToneData, Status is failed. status = "

    .line 1111
    .line 1112
    invoke-static {v0, v2, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 1113
    .line 1114
    .line 1115
    return-void

    .line 1116
    :cond_45b
    array-length v0, v9

    .line 1117
    if-gt v0, v11, :cond_464

    .line 1118
    .line 1119
    const-string v0, "handleRecvEarToneData, The length of data is not valid."

    .line 1120
    .line 1121
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1122
    .line 1123
    .line 1124
    return-void

    .line 1125
    :cond_464
    invoke-static {v11, v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->g(I[B)Ljava/util/ArrayList;

    .line 1126
    .line 1127
    .line 1128
    move-result-object v0

    .line 1129
    new-instance v3, Landroid/util/Pair;

    .line 1130
    .line 1131
    invoke-direct {v3, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1132
    .line 1133
    .line 1134
    const/16 v0, 0x34

    .line 1135
    .line 1136
    invoke-virtual {v15, v0, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1137
    .line 1138
    .line 1139
    move-result-object v0

    .line 1140
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1141
    .line 1142
    .line 1143
    return-void

    .line 1144
    :pswitch_477
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 1145
    .line 1146
    .line 1147
    move-result v4

    .line 1148
    if-eqz v4, :cond_484

    .line 1149
    .line 1150
    const-string v0, "handleRecvEarScanFilterData, Status is failed. status = "

    .line 1151
    .line 1152
    invoke-static {v4, v0, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 1153
    .line 1154
    .line 1155
    goto/16 :goto_8c9

    .line 1156
    .line 1157
    :cond_484
    array-length v4, v9

    .line 1158
    if-gt v4, v11, :cond_48e

    .line 1159
    .line 1160
    const-string v0, "handleRecvEarScanFilterData, The length of data is not valid."

    .line 1161
    .line 1162
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1163
    .line 1164
    .line 1165
    goto/16 :goto_8c9

    .line 1166
    .line 1167
    :cond_48e
    sget-object v4, Lu8/a$a;->a:Lu8/a;

    .line 1168
    .line 1169
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1170
    .line 1171
    .line 1172
    new-instance v5, Ljava/util/ArrayList;

    .line 1173
    .line 1174
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1175
    .line 1176
    .line 1177
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1178
    .line 1179
    .line 1180
    move-result v6

    .line 1181
    if-nez v6, :cond_5a0

    .line 1182
    .line 1183
    invoke-virtual {v0}, Lw8/a;->a()I

    .line 1184
    .line 1185
    .line 1186
    move-result v0

    .line 1187
    invoke-static {v2, v0}, Lcom/oplus/melody/btsdk/api/data/HearingEnhanceFreqPacket;->getMapKey(Ljava/lang/String;I)Ljava/lang/String;

    .line 1188
    .line 1189
    .line 1190
    move-result-object v6

    .line 1191
    iget-object v7, v4, Lu8/a;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 1192
    .line 1193
    invoke-virtual {v7, v6}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1194
    .line 1195
    .line 1196
    move-result-object v8

    .line 1197
    check-cast v8, Lcom/oplus/melody/btsdk/api/data/HearingEnhanceFreqPacket;

    .line 1198
    .line 1199
    if-nez v8, :cond_4b5

    .line 1200
    .line 1201
    new-instance v8, Lcom/oplus/melody/btsdk/api/data/HearingEnhanceFreqPacket;

    .line 1202
    .line 1203
    invoke-direct {v8}, Lcom/oplus/melody/btsdk/api/data/HearingEnhanceFreqPacket;-><init>()V

    .line 1204
    .line 1205
    .line 1206
    :cond_4b5
    invoke-virtual {v8, v2}, Lcom/oplus/melody/btsdk/api/data/HearingEnhanceFreqPacket;->setAddress(Ljava/lang/String;)V

    .line 1207
    .line 1208
    .line 1209
    :try_start_4b8
    invoke-static {v9}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 1210
    .line 1211
    .line 1212
    move-result-object v9

    .line 1213
    invoke-virtual {v9, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 1214
    .line 1215
    .line 1216
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->getInt()I

    .line 1217
    .line 1218
    .line 1219
    move-result v10

    .line 1220
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->get()B

    .line 1221
    .line 1222
    .line 1223
    move-result v12

    .line 1224
    const/4 v13, 0x2

    .line 1225
    new-array v14, v13, [B

    .line 1226
    .line 1227
    invoke-virtual {v9, v14}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 1228
    .line 1229
    .line 1230
    invoke-static {v14, v3, v13, v11}, Ln7/d;->d([BIIZ)I

    .line 1231
    .line 1232
    .line 1233
    move-result v14

    .line 1234
    new-array v3, v13, [B

    .line 1235
    .line 1236
    invoke-virtual {v9, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 1237
    .line 1238
    .line 1239
    const/4 v1, 0x0

    .line 1240
    invoke-static {v3, v1, v13, v11}, Ln7/d;->d([BIIZ)I

    .line 1241
    .line 1242
    .line 1243
    move-result v3

    .line 1244
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->get()B

    .line 1245
    .line 1246
    .line 1247
    move-result v1

    .line 1248
    invoke-virtual {v9}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 1249
    .line 1250
    .line 1251
    move-result v13

    .line 1252
    move/from16 v25, v11

    .line 1253
    .line 1254
    new-instance v11, Ljava/util/ArrayList;

    .line 1255
    .line 1256
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V
    :try_end_4ea
    .catch Ljava/lang/Exception; {:try_start_4b8 .. :try_end_4ea} :catch_588

    .line 1257
    .line 1258
    .line 1259
    if-eqz v13, :cond_549

    .line 1260
    .line 1261
    :try_start_4ec
    invoke-virtual {v9}, Ljava/nio/Buffer;->remaining()I

    .line 1262
    .line 1263
    .line 1264
    move-result v13
    :try_end_4f0
    .catch Ljava/lang/Exception; {:try_start_4ec .. :try_end_4f0} :catch_543

    .line 1265
    move-object/from16 v26, v15

    .line 1266
    .line 1267
    :try_start_4f2
    new-array v15, v13, [B
    :try_end_4f4
    .catch Ljava/lang/Exception; {:try_start_4f2 .. :try_end_4f4} :catch_53f

    .line 1268
    .line 1269
    move-object/from16 v16, v5

    .line 1270
    .line 1271
    const/4 v5, 0x0

    .line 1272
    :try_start_4f7
    invoke-virtual {v9, v15, v5, v13}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 1273
    .line 1274
    .line 1275
    move v9, v5

    .line 1276
    :goto_4fb
    add-int/lit8 v5, v13, -0x4

    .line 1277
    .line 1278
    if-gt v9, v5, :cond_53c

    .line 1279
    .line 1280
    move/from16 p2, v13

    .line 1281
    .line 1282
    move/from16 v5, v20

    .line 1283
    .line 1284
    new-array v13, v5, [B

    .line 1285
    .line 1286
    move-object/from16 v17, v6

    .line 1287
    .line 1288
    const/4 v6, 0x0

    .line 1289
    invoke-static {v15, v9, v13, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1290
    .line 1291
    .line 1292
    new-array v6, v5, [B

    .line 1293
    .line 1294
    move-object/from16 v18, v6

    .line 1295
    .line 1296
    const/4 v6, 0x0

    .line 1297
    :goto_510
    if-ge v6, v5, :cond_51e

    .line 1298
    .line 1299
    const/16 v22, 0x3

    .line 1300
    .line 1301
    rsub-int/lit8 v5, v6, 0x3

    .line 1302
    .line 1303
    aget-byte v5, v13, v5

    .line 1304
    .line 1305
    aput-byte v5, v18, v6

    .line 1306
    .line 1307
    add-int/lit8 v6, v6, 0x1

    .line 1308
    .line 1309
    const/4 v5, 0x4

    .line 1310
    goto :goto_510

    .line 1311
    :cond_51e
    invoke-static/range {v18 .. v18}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 1312
    .line 1313
    .line 1314
    move-result-object v5

    .line 1315
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getFloat()F

    .line 1316
    .line 1317
    .line 1318
    move-result v5

    .line 1319
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 1320
    .line 1321
    .line 1322
    move-result-object v5

    .line 1323
    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1324
    .line 1325
    .line 1326
    const/16 v20, 0x4

    .line 1327
    .line 1328
    add-int/lit8 v9, v9, 0x4

    .line 1329
    .line 1330
    move/from16 v13, p2

    .line 1331
    .line 1332
    move-object/from16 v6, v17

    .line 1333
    .line 1334
    const/16 v20, 0x4

    .line 1335
    .line 1336
    goto :goto_4fb

    .line 1337
    :catch_538
    move-exception v0

    .line 1338
    :goto_539
    move-object/from16 v1, v16

    .line 1339
    .line 1340
    goto :goto_58c

    .line 1341
    :cond_53c
    :goto_53c
    move-object/from16 v17, v6

    .line 1342
    .line 1343
    goto :goto_54e

    .line 1344
    :catch_53f
    move-exception v0

    .line 1345
    move-object/from16 v16, v5

    .line 1346
    .line 1347
    goto :goto_539

    .line 1348
    :catch_543
    move-exception v0

    .line 1349
    move-object/from16 v16, v5

    .line 1350
    .line 1351
    move-object/from16 v26, v15

    .line 1352
    .line 1353
    goto :goto_539

    .line 1354
    :cond_549
    move-object/from16 v16, v5

    .line 1355
    .line 1356
    move-object/from16 v26, v15

    .line 1357
    .line 1358
    goto :goto_53c

    .line 1359
    :goto_54e
    invoke-virtual {v8, v3}, Lcom/oplus/melody/btsdk/api/data/HearingEnhanceFreqPacket;->setTotalNum(I)V

    .line 1360
    .line 1361
    .line 1362
    invoke-virtual {v8, v14}, Lcom/oplus/melody/btsdk/api/data/HearingEnhanceFreqPacket;->setSamplingFrequency(I)V

    .line 1363
    .line 1364
    .line 1365
    invoke-virtual {v8, v0}, Lcom/oplus/melody/btsdk/api/data/HearingEnhanceFreqPacket;->setKey(I)V

    .line 1366
    .line 1367
    .line 1368
    invoke-virtual {v8, v10}, Lcom/oplus/melody/btsdk/api/data/HearingEnhanceFreqPacket;->setUid(I)V

    .line 1369
    .line 1370
    .line 1371
    invoke-virtual {v8, v2, v1, v12, v11}, Lcom/oplus/melody/btsdk/api/data/HearingEnhanceFreqPacket;->addPacket(Ljava/lang/String;BILjava/util/List;)V

    .line 1372
    .line 1373
    .line 1374
    const/16 v0, 0x180

    .line 1375
    .line 1376
    if-ne v3, v0, :cond_564

    .line 1377
    .line 1378
    move/from16 v9, v25

    .line 1379
    .line 1380
    goto :goto_565

    .line 1381
    :cond_564
    const/4 v9, 0x2

    .line 1382
    :goto_565
    invoke-virtual {v8, v9}, Lcom/oplus/melody/btsdk/api/data/HearingEnhanceFreqPacket;->setType(I)V

    .line 1383
    .line 1384
    .line 1385
    invoke-virtual {v8}, Lcom/oplus/melody/btsdk/api/data/HearingEnhanceFreqPacket;->isComplete()Z

    .line 1386
    .line 1387
    .line 1388
    move-result v0

    .line 1389
    if-eqz v0, :cond_580

    .line 1390
    .line 1391
    iget-object v0, v4, Lu8/a;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 1392
    .line 1393
    invoke-virtual {v0, v2, v8}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1394
    .line 1395
    .line 1396
    move-object/from16 v0, v17

    .line 1397
    .line 1398
    invoke-virtual {v7, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_578
    .catch Ljava/lang/Exception; {:try_start_4f7 .. :try_end_578} :catch_538

    .line 1399
    .line 1400
    .line 1401
    move-object/from16 v1, v16

    .line 1402
    .line 1403
    :try_start_57a
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1404
    .line 1405
    .line 1406
    goto :goto_5a3

    .line 1407
    :catch_57e
    move-exception v0

    .line 1408
    goto :goto_58c

    .line 1409
    :cond_580
    move-object/from16 v1, v16

    .line 1410
    .line 1411
    move-object/from16 v0, v17

    .line 1412
    .line 1413
    invoke-virtual {v7, v0, v8}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_587
    .catch Ljava/lang/Exception; {:try_start_57a .. :try_end_587} :catch_57e

    .line 1414
    .line 1415
    .line 1416
    goto :goto_5a3

    .line 1417
    :catch_588
    move-exception v0

    .line 1418
    move-object v1, v5

    .line 1419
    move-object/from16 v26, v15

    .line 1420
    .line 1421
    :goto_58c
    new-instance v3, Ljava/lang/StringBuilder;

    .line 1422
    .line 1423
    const-string v4, "onReceiveHearingProtectionFreqPacket throws Exception:"

    .line 1424
    .line 1425
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1426
    .line 1427
    .line 1428
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1429
    .line 1430
    .line 1431
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1432
    .line 1433
    .line 1434
    move-result-object v0

    .line 1435
    const-string v3, "FreqDataCache"

    .line 1436
    .line 1437
    invoke-static {v3, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1438
    .line 1439
    .line 1440
    goto :goto_5a3

    .line 1441
    :cond_5a0
    move-object v1, v5

    .line 1442
    move-object/from16 v26, v15

    .line 1443
    .line 1444
    :goto_5a3
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 1445
    .line 1446
    .line 1447
    move-result v0

    .line 1448
    if-nez v0, :cond_8c9

    .line 1449
    .line 1450
    new-instance v0, Landroid/util/Pair;

    .line 1451
    .line 1452
    invoke-direct {v0, v2, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1453
    .line 1454
    .line 1455
    const/16 v1, 0x30

    .line 1456
    .line 1457
    move-object/from16 v3, v26

    .line 1458
    .line 1459
    invoke-virtual {v3, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1460
    .line 1461
    .line 1462
    move-result-object v0

    .line 1463
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1464
    .line 1465
    .line 1466
    goto/16 :goto_8c9

    .line 1467
    .line 1468
    :pswitch_5bb
    move/from16 v25, v11

    .line 1469
    .line 1470
    move-object v3, v15

    .line 1471
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 1472
    .line 1473
    .line 1474
    move-result v0

    .line 1475
    if-eqz v0, :cond_5ca

    .line 1476
    .line 1477
    const-string v1, "handleRecvEarScanData, status is failed. status = "

    .line 1478
    .line 1479
    invoke-static {v0, v1, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 1480
    .line 1481
    .line 1482
    return-void

    .line 1483
    :cond_5ca
    array-length v0, v9

    .line 1484
    move/from16 v1, v25

    .line 1485
    .line 1486
    if-gt v0, v1, :cond_5d5

    .line 1487
    .line 1488
    const-string v0, "handleRecvEarScanData The length of data is 1, invalid."

    .line 1489
    .line 1490
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1491
    .line 1492
    .line 1493
    return-void

    .line 1494
    :cond_5d5
    invoke-static {v1, v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->f(I[B)Lcom/oplus/melody/btsdk/api/data/HearingEnhancementEarScanResult;

    .line 1495
    .line 1496
    .line 1497
    move-result-object v0

    .line 1498
    if-eqz v0, :cond_8c9

    .line 1499
    .line 1500
    invoke-virtual {v0, v2}, Lcom/oplus/melody/btsdk/api/data/HearingEnhancementEarScanResult;->setAddress(Ljava/lang/String;)V

    .line 1501
    .line 1502
    .line 1503
    new-instance v1, Landroid/util/Pair;

    .line 1504
    .line 1505
    invoke-direct {v1, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1506
    .line 1507
    .line 1508
    const/16 v0, 0x2f

    .line 1509
    .line 1510
    invoke-virtual {v3, v0, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1511
    .line 1512
    .line 1513
    move-result-object v0

    .line 1514
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1515
    .line 1516
    .line 1517
    return-void

    .line 1518
    :pswitch_5ed
    move-object v3, v15

    .line 1519
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 1520
    .line 1521
    .line 1522
    move-result v0

    .line 1523
    if-eqz v0, :cond_5fa

    .line 1524
    .line 1525
    const-string v1, "The status is not success when receive ear in buds commadn. "

    .line 1526
    .line 1527
    invoke-static {v0, v1, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 1528
    .line 1529
    .line 1530
    return-void

    .line 1531
    :cond_5fa
    array-length v0, v9

    .line 1532
    const/4 v1, 0x1

    .line 1533
    if-gt v0, v1, :cond_604

    .line 1534
    .line 1535
    const-string v0, "The length of data is 1, not valid when receive multiply connection info."

    .line 1536
    .line 1537
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1538
    .line 1539
    .line 1540
    return-void

    .line 1541
    :cond_604
    aget-byte v0, v9, v1

    .line 1542
    .line 1543
    new-instance v1, Lcom/oplus/melody/btsdk/protocol/commands/d;

    .line 1544
    .line 1545
    const/4 v4, 0x2

    .line 1546
    invoke-direct {v1, v9, v4}, Lcom/oplus/melody/btsdk/protocol/commands/d;-><init>([BI)V

    .line 1547
    .line 1548
    .line 1549
    invoke-static {v14, v1}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 1550
    .line 1551
    .line 1552
    const/16 v1, 0x26

    .line 1553
    .line 1554
    const/4 v4, -0x1

    .line 1555
    invoke-virtual {v3, v1, v0, v4, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 1556
    .line 1557
    .line 1558
    move-result-object v0

    .line 1559
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1560
    .line 1561
    .line 1562
    return-void

    .line 1563
    :pswitch_61a
    move-object v3, v15

    .line 1564
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 1565
    .line 1566
    .line 1567
    move-result v0

    .line 1568
    if-eqz v0, :cond_627

    .line 1569
    .line 1570
    const-string v1, "Status is failed when receive remote technica status command. status = "

    .line 1571
    .line 1572
    invoke-static {v0, v1, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 1573
    .line 1574
    .line 1575
    return-void

    .line 1576
    :cond_627
    array-length v0, v9

    .line 1577
    const/4 v1, 0x1

    .line 1578
    if-gt v0, v1, :cond_631

    .line 1579
    .line 1580
    const-string v0, "The length of data is 1, not valid when receive triangle info."

    .line 1581
    .line 1582
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1583
    .line 1584
    .line 1585
    return-void

    .line 1586
    :cond_631
    new-instance v0, Lcom/oplus/melody/btsdk/api/data/TriangleInfo;

    .line 1587
    .line 1588
    invoke-direct {v0, v1, v9}, Lcom/oplus/melody/btsdk/api/data/TriangleInfo;-><init>(I[B)V

    .line 1589
    .line 1590
    .line 1591
    new-instance v1, Landroid/util/Pair;

    .line 1592
    .line 1593
    invoke-direct {v1, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1594
    .line 1595
    .line 1596
    const/16 v0, 0x3d

    .line 1597
    .line 1598
    invoke-virtual {v3, v0, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1599
    .line 1600
    .line 1601
    move-result-object v0

    .line 1602
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1603
    .line 1604
    .line 1605
    return-void

    .line 1606
    :pswitch_645
    move-object v3, v15

    .line 1607
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 1608
    .line 1609
    .line 1610
    move-result v0

    .line 1611
    if-eqz v0, :cond_652

    .line 1612
    .line 1613
    const-string v1, "Status is failed when receive PersonalizedNoiseReductionResult command. status = "

    .line 1614
    .line 1615
    invoke-static {v0, v1, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 1616
    .line 1617
    .line 1618
    return-void

    .line 1619
    :cond_652
    array-length v0, v9

    .line 1620
    const/4 v1, 0x1

    .line 1621
    if-gt v0, v1, :cond_65c

    .line 1622
    .line 1623
    const-string v0, "The length of data is not valid when receive PersonalizedNoiseReductionResult."

    .line 1624
    .line 1625
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1626
    .line 1627
    .line 1628
    return-void

    .line 1629
    :cond_65c
    new-instance v0, Lcom/oplus/melody/btsdk/api/data/PersonalizedNoiseReductionResultExist;

    .line 1630
    .line 1631
    invoke-direct {v0, v1, v9}, Lcom/oplus/melody/btsdk/api/data/PersonalizedNoiseReductionResultExist;-><init>(I[B)V

    .line 1632
    .line 1633
    .line 1634
    new-instance v1, Landroid/util/Pair;

    .line 1635
    .line 1636
    invoke-direct {v1, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1637
    .line 1638
    .line 1639
    const/16 v0, 0x1e

    .line 1640
    .line 1641
    invoke-virtual {v3, v0, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1642
    .line 1643
    .line 1644
    move-result-object v0

    .line 1645
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1646
    .line 1647
    .line 1648
    return-void

    .line 1649
    :pswitch_670
    move-object v3, v15

    .line 1650
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 1651
    .line 1652
    .line 1653
    move-result v0

    .line 1654
    if-eqz v0, :cond_67d

    .line 1655
    .line 1656
    const-string v1, "Status is failed when receive earphone zenmode file information. status = "

    .line 1657
    .line 1658
    invoke-static {v0, v1, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 1659
    .line 1660
    .line 1661
    return-void

    .line 1662
    :cond_67d
    const-string v0, "The length of data is not valid when parse remote zenmode file info"

    .line 1663
    .line 1664
    if-eqz v9, :cond_6ac

    .line 1665
    .line 1666
    array-length v1, v9

    .line 1667
    const/4 v4, 0x1

    .line 1668
    if-gt v1, v4, :cond_686

    .line 1669
    .line 1670
    goto :goto_6ac

    .line 1671
    :cond_686
    array-length v1, v9

    .line 1672
    move/from16 v5, v19

    .line 1673
    .line 1674
    if-ge v1, v5, :cond_691

    .line 1675
    .line 1676
    invoke-static {v6, v0}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 1677
    .line 1678
    .line 1679
    :goto_68e
    move-object/from16 v4, v23

    .line 1680
    .line 1681
    goto :goto_6b0

    .line 1682
    :cond_691
    const/4 v5, 0x4

    .line 1683
    invoke-static {v9, v4, v5, v4}, Ln7/d;->d([BIIZ)I

    .line 1684
    .line 1685
    .line 1686
    move-result v0

    .line 1687
    const/4 v1, 0x5

    .line 1688
    invoke-static {v9, v1, v4, v4}, Ln7/d;->d([BIIZ)I

    .line 1689
    .line 1690
    .line 1691
    move-result v1

    .line 1692
    array-length v4, v9

    .line 1693
    add-int/lit8 v4, v4, -0x6

    .line 1694
    .line 1695
    new-array v5, v4, [B

    .line 1696
    .line 1697
    move/from16 v7, v18

    .line 1698
    .line 1699
    const/4 v6, 0x0

    .line 1700
    invoke-static {v9, v7, v5, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1701
    .line 1702
    .line 1703
    new-instance v4, Lcom/oplus/melody/btsdk/api/data/ZenModeFileInformation;

    .line 1704
    .line 1705
    invoke-direct {v4, v0, v1, v5}, Lcom/oplus/melody/btsdk/api/data/ZenModeFileInformation;-><init>(II[B)V

    .line 1706
    .line 1707
    .line 1708
    goto :goto_6b0

    .line 1709
    :cond_6ac
    :goto_6ac
    invoke-static {v6, v0}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 1710
    .line 1711
    .line 1712
    goto :goto_68e

    .line 1713
    :goto_6b0
    if-nez v4, :cond_6b8

    .line 1714
    .line 1715
    const-string v0, "Information is validate when receive earphone zenmode file information ."

    .line 1716
    .line 1717
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1718
    .line 1719
    .line 1720
    return-void

    .line 1721
    :cond_6b8
    new-instance v0, Landroid/util/Pair;

    .line 1722
    .line 1723
    invoke-direct {v0, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1724
    .line 1725
    .line 1726
    const/16 v1, 0x24

    .line 1727
    .line 1728
    const/4 v4, -0x1

    .line 1729
    invoke-virtual {v3, v1, v4, v4, v0}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 1730
    .line 1731
    .line 1732
    move-result-object v0

    .line 1733
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1734
    .line 1735
    .line 1736
    return-void

    .line 1737
    :pswitch_6c8
    move-object v3, v15

    .line 1738
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 1739
    .line 1740
    .line 1741
    move-result v0

    .line 1742
    if-eqz v0, :cond_6d6

    .line 1743
    .line 1744
    const-string v1, "handleRecvEarRestoreData, Status is failed when receive restore data command. status = "

    .line 1745
    .line 1746
    invoke-static {v0, v1, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 1747
    .line 1748
    .line 1749
    goto/16 :goto_8c9

    .line 1750
    .line 1751
    :cond_6d6
    array-length v0, v9

    .line 1752
    const/4 v1, 0x1

    .line 1753
    if-gt v0, v1, :cond_6e1

    .line 1754
    .line 1755
    const-string v0, "handleRecvEarRestoreData, The length of data is not valid when receive restore data."

    .line 1756
    .line 1757
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1758
    .line 1759
    .line 1760
    goto/16 :goto_8c9

    .line 1761
    .line 1762
    :cond_6e1
    invoke-static {v9}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 1763
    .line 1764
    .line 1765
    move-result-object v0

    .line 1766
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 1767
    .line 1768
    .line 1769
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    .line 1770
    .line 1771
    .line 1772
    move-result v1

    .line 1773
    and-int/lit16 v1, v1, 0xff

    .line 1774
    .line 1775
    new-instance v4, Ljava/util/ArrayList;

    .line 1776
    .line 1777
    invoke-direct {v4, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1778
    .line 1779
    .line 1780
    const/4 v5, 0x0

    .line 1781
    :goto_6f4
    if-ge v5, v1, :cond_71e

    .line 1782
    .line 1783
    :try_start_6f6
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    .line 1784
    .line 1785
    .line 1786
    move-result v6

    .line 1787
    const/4 v13, 0x2

    .line 1788
    new-array v7, v13, [B

    .line 1789
    .line 1790
    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 1791
    .line 1792
    .line 1793
    const/4 v8, 0x1

    .line 1794
    const/4 v9, 0x0

    .line 1795
    invoke-static {v7, v9, v13, v8}, Ln7/d;->d([BIIZ)I

    .line 1796
    .line 1797
    .line 1798
    move-result v7

    .line 1799
    new-array v8, v7, [B

    .line 1800
    .line 1801
    invoke-virtual {v0, v8}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 1802
    .line 1803
    .line 1804
    new-instance v9, Lcom/oplus/melody/btsdk/api/data/EarRestoreDataInfo;

    .line 1805
    .line 1806
    invoke-direct {v9, v6, v7, v8}, Lcom/oplus/melody/btsdk/api/data/EarRestoreDataInfo;-><init>(II[B)V

    .line 1807
    .line 1808
    .line 1809
    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_713
    .catch Ljava/lang/Exception; {:try_start_6f6 .. :try_end_713} :catch_718

    .line 1810
    .line 1811
    .line 1812
    const/16 v25, 0x1

    .line 1813
    .line 1814
    add-int/lit8 v5, v5, 0x1

    .line 1815
    .line 1816
    goto :goto_6f4

    .line 1817
    :catch_718
    move-exception v0

    .line 1818
    const-string v1, "handleRecvEarRestoreData"

    .line 1819
    .line 1820
    invoke-static {v14, v1, v0}, LQ8/a;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1821
    .line 1822
    .line 1823
    :cond_71e
    new-instance v0, Landroid/util/Pair;

    .line 1824
    .line 1825
    invoke-direct {v0, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1826
    .line 1827
    .line 1828
    const/16 v4, 0x1c

    .line 1829
    .line 1830
    invoke-virtual {v3, v4, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1831
    .line 1832
    .line 1833
    move-result-object v0

    .line 1834
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 1835
    .line 1836
    .line 1837
    goto/16 :goto_8c9

    .line 1838
    .line 1839
    :pswitch_72e
    move-object v3, v15

    .line 1840
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 1841
    .line 1842
    .line 1843
    move-result v0

    .line 1844
    if-eqz v0, :cond_73c

    .line 1845
    .line 1846
    const-string v1, "handleRecvEarphoneIdentity, Status is failed when receive. status = "

    .line 1847
    .line 1848
    invoke-static {v0, v1, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 1849
    .line 1850
    .line 1851
    goto/16 :goto_8c9

    .line 1852
    .line 1853
    :cond_73c
    array-length v0, v9

    .line 1854
    const/4 v1, 0x1

    .line 1855
    if-gt v0, v1, :cond_747

    .line 1856
    .line 1857
    const-string v0, "handleRecvEarphoneIdentity, The length of data is not valid."

    .line 1858
    .line 1859
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1860
    .line 1861
    .line 1862
    goto/16 :goto_8c9

    .line 1863
    .line 1864
    :cond_747
    new-instance v0, Lcom/oplus/melody/btsdk/protocol/commands/d;

    .line 1865
    .line 1866
    const/4 v5, 0x3

    .line 1867
    invoke-direct {v0, v9, v5}, Lcom/oplus/melody/btsdk/protocol/commands/d;-><init>([BI)V

    .line 1868
    .line 1869
    .line 1870
    invoke-static {v14, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 1871
    .line 1872
    .line 1873
    invoke-static {v9}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 1874
    .line 1875
    .line 1876
    move-result-object v4

    .line 1877
    invoke-virtual {v4, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 1878
    .line 1879
    .line 1880
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    .line 1881
    .line 1882
    .line 1883
    move-result v0

    .line 1884
    and-int/lit16 v1, v0, 0xff

    .line 1885
    .line 1886
    new-instance v5, Lcom/oplus/melody/btsdk/api/data/EarphoneIdentity;

    .line 1887
    .line 1888
    invoke-direct {v5}, Lcom/oplus/melody/btsdk/api/data/EarphoneIdentity;-><init>()V

    .line 1889
    .line 1890
    .line 1891
    const/4 v6, 0x0

    .line 1892
    :goto_763
    if-ge v6, v1, :cond_7e6

    .line 1893
    .line 1894
    :try_start_765
    invoke-virtual {v4}, Ljava/nio/Buffer;->remaining()I

    .line 1895
    .line 1896
    .line 1897
    move-result v0
    :try_end_769
    .catch Ljava/lang/Exception; {:try_start_765 .. :try_end_769} :catch_78d

    .line 1898
    const-string v7, ", remaining="

    .line 1899
    .line 1900
    const/4 v8, 0x3

    .line 1901
    if-ge v0, v8, :cond_78f

    .line 1902
    .line 1903
    :try_start_76e
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1904
    .line 1905
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1906
    .line 1907
    .line 1908
    const-string v8, "handleRecvEarphoneIdentity, header truncated, index="

    .line 1909
    .line 1910
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1911
    .line 1912
    .line 1913
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1914
    .line 1915
    .line 1916
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1917
    .line 1918
    .line 1919
    invoke-virtual {v4}, Ljava/nio/Buffer;->remaining()I

    .line 1920
    .line 1921
    .line 1922
    move-result v7

    .line 1923
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1924
    .line 1925
    .line 1926
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1927
    .line 1928
    .line 1929
    move-result-object v0

    .line 1930
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1931
    .line 1932
    .line 1933
    goto :goto_7e6

    .line 1934
    :catch_78d
    move-exception v0

    .line 1935
    goto :goto_7dc

    .line 1936
    :cond_78f
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    .line 1937
    .line 1938
    .line 1939
    move-result v0

    .line 1940
    and-int/lit16 v0, v0, 0xff

    .line 1941
    .line 1942
    const/4 v13, 0x2

    .line 1943
    new-array v8, v13, [B

    .line 1944
    .line 1945
    invoke-virtual {v4, v8}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 1946
    .line 1947
    .line 1948
    const/4 v9, 0x1

    .line 1949
    const/4 v10, 0x0

    .line 1950
    invoke-static {v8, v10, v13, v9}, Ln7/d;->d([BIIZ)I

    .line 1951
    .line 1952
    .line 1953
    move-result v8

    .line 1954
    if-ltz v8, :cond_7b5

    .line 1955
    .line 1956
    invoke-virtual {v4}, Ljava/nio/Buffer;->remaining()I

    .line 1957
    .line 1958
    .line 1959
    move-result v9

    .line 1960
    if-ge v9, v8, :cond_7aa

    .line 1961
    .line 1962
    goto :goto_7b5

    .line 1963
    :cond_7aa
    new-array v7, v8, [B

    .line 1964
    .line 1965
    invoke-virtual {v4, v7}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 1966
    .line 1967
    .line 1968
    invoke-static {v5, v0, v7}, Lcom/oplus/melody/btsdk/protocol/commands/m;->a(Lcom/oplus/melody/btsdk/api/data/EarphoneIdentity;I[B)V

    .line 1969
    .line 1970
    .line 1971
    :goto_7b2
    const/16 v25, 0x1

    .line 1972
    .line 1973
    goto :goto_7e2

    .line 1974
    :cond_7b5
    :goto_7b5
    new-instance v9, Ljava/lang/StringBuilder;

    .line 1975
    .line 1976
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 1977
    .line 1978
    .line 1979
    const-string v10, "handleRecvEarphoneIdentity, invalid value length, type="

    .line 1980
    .line 1981
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1982
    .line 1983
    .line 1984
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1985
    .line 1986
    .line 1987
    const-string v0, ", length="

    .line 1988
    .line 1989
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1990
    .line 1991
    .line 1992
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1993
    .line 1994
    .line 1995
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1996
    .line 1997
    .line 1998
    invoke-virtual {v4}, Ljava/nio/Buffer;->remaining()I

    .line 1999
    .line 2000
    .line 2001
    move-result v0

    .line 2002
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2003
    .line 2004
    .line 2005
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2006
    .line 2007
    .line 2008
    move-result-object v0

    .line 2009
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7db
    .catch Ljava/lang/Exception; {:try_start_76e .. :try_end_7db} :catch_78d

    .line 2010
    .line 2011
    .line 2012
    goto :goto_7e6

    .line 2013
    :goto_7dc
    const-string v7, "handleRecvEarphoneIdentity"

    .line 2014
    .line 2015
    invoke-static {v14, v7, v0}, LQ8/a;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2016
    .line 2017
    .line 2018
    goto :goto_7b2

    .line 2019
    :goto_7e2
    add-int/lit8 v6, v6, 0x1

    .line 2020
    .line 2021
    goto/16 :goto_763

    .line 2022
    .line 2023
    :cond_7e6
    :goto_7e6
    new-instance v0, Lcb/f;

    .line 2024
    .line 2025
    const/4 v4, 0x3

    .line 2026
    invoke-direct {v0, v5, v4}, Lcb/f;-><init>(Ljava/lang/Object;I)V

    .line 2027
    .line 2028
    .line 2029
    invoke-static {v14, v0, v2}, LQ8/a;->d(Ljava/lang/String;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 2030
    .line 2031
    .line 2032
    new-instance v0, Landroid/util/Pair;

    .line 2033
    .line 2034
    invoke-direct {v0, v2, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2035
    .line 2036
    .line 2037
    const/16 v1, 0x5f

    .line 2038
    .line 2039
    invoke-virtual {v3, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2040
    .line 2041
    .line 2042
    move-result-object v0

    .line 2043
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2044
    .line 2045
    .line 2046
    goto/16 :goto_8c9

    .line 2047
    .line 2048
    :pswitch_7ff
    move-object v3, v15

    .line 2049
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 2050
    .line 2051
    .line 2052
    move-result v1

    .line 2053
    if-eqz v1, :cond_80c

    .line 2054
    .line 2055
    const-string v0, "handleRecvHearingEnhancementFilterData, Status is failed. status = "

    .line 2056
    .line 2057
    invoke-static {v1, v0, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 2058
    .line 2059
    .line 2060
    return-void

    .line 2061
    :cond_80c
    array-length v1, v9

    .line 2062
    const/4 v4, 0x1

    .line 2063
    if-gt v1, v4, :cond_816

    .line 2064
    .line 2065
    const-string v0, "handleRecvHearingEnhancementFilterData, The length of data is not valid."

    .line 2066
    .line 2067
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2068
    .line 2069
    .line 2070
    return-void

    .line 2071
    :cond_816
    sget-object v1, Lu8/a$a;->a:Lu8/a;

    .line 2072
    .line 2073
    invoke-virtual {v1, v2, v0, v9}, Lu8/a;->a(Ljava/lang/String;Lw8/a;[B)Ljava/util/ArrayList;

    .line 2074
    .line 2075
    .line 2076
    move-result-object v0

    .line 2077
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 2078
    .line 2079
    .line 2080
    move-result v1

    .line 2081
    if-nez v1, :cond_8c9

    .line 2082
    .line 2083
    new-instance v1, Landroid/util/Pair;

    .line 2084
    .line 2085
    invoke-direct {v1, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2086
    .line 2087
    .line 2088
    const/16 v0, 0x1a

    .line 2089
    .line 2090
    invoke-virtual {v3, v0, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2091
    .line 2092
    .line 2093
    move-result-object v0

    .line 2094
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2095
    .line 2096
    .line 2097
    return-void

    .line 2098
    :pswitch_831
    move-object v3, v15

    .line 2099
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 2100
    .line 2101
    .line 2102
    move-result v0

    .line 2103
    if-eqz v0, :cond_83f

    .line 2104
    .line 2105
    const-string v1, "handleRecvHearingEnhancementData, status is failed. status = "

    .line 2106
    .line 2107
    invoke-static {v0, v1, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 2108
    .line 2109
    .line 2110
    goto/16 :goto_8c9

    .line 2111
    .line 2112
    :cond_83f
    array-length v0, v9

    .line 2113
    const/4 v1, 0x1

    .line 2114
    if-gt v0, v1, :cond_84a

    .line 2115
    .line 2116
    const-string v0, "handleRecvHearingEnhancementData The length of data is 1, invalid."

    .line 2117
    .line 2118
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2119
    .line 2120
    .line 2121
    goto/16 :goto_8c9

    .line 2122
    .line 2123
    :cond_84a
    :try_start_84a
    new-instance v0, Lcom/oplus/melody/btsdk/api/data/HearingEnhancementInfo;

    .line 2124
    .line 2125
    invoke-direct {v0}, Lcom/oplus/melody/btsdk/api/data/HearingEnhancementInfo;-><init>()V

    .line 2126
    .line 2127
    .line 2128
    invoke-static {v9}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 2129
    .line 2130
    .line 2131
    move-result-object v4

    .line 2132
    invoke-virtual {v4, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 2133
    .line 2134
    .line 2135
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    .line 2136
    .line 2137
    .line 2138
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    .line 2139
    .line 2140
    .line 2141
    move-result v1

    .line 2142
    and-int/lit16 v1, v1, 0xff

    .line 2143
    .line 2144
    new-instance v5, Ljava/util/ArrayList;

    .line 2145
    .line 2146
    invoke-direct {v5, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2147
    .line 2148
    .line 2149
    const/4 v6, 0x0

    .line 2150
    :goto_865
    if-ge v6, v1, :cond_87d

    .line 2151
    .line 2152
    const/4 v8, 0x3

    .line 2153
    new-array v7, v8, [B

    .line 2154
    .line 2155
    const/4 v9, 0x0

    .line 2156
    invoke-virtual {v4, v7, v9, v8}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 2157
    .line 2158
    .line 2159
    new-instance v8, Lcom/oplus/melody/btsdk/api/data/HearingDetectingInfo;

    .line 2160
    .line 2161
    invoke-direct {v8, v7}, Lcom/oplus/melody/btsdk/api/data/HearingDetectingInfo;-><init>([B)V

    .line 2162
    .line 2163
    .line 2164
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2165
    .line 2166
    .line 2167
    const/16 v25, 0x1

    .line 2168
    .line 2169
    add-int/lit8 v6, v6, 0x1

    .line 2170
    .line 2171
    goto :goto_865

    .line 2172
    :catch_87b
    move-exception v0

    .line 2173
    goto :goto_8c4

    .line 2174
    :cond_87d
    invoke-virtual {v0, v5}, Lcom/oplus/melody/btsdk/api/data/HearingEnhancementInfo;->setHearingDetectingInfoList(Ljava/util/List;)V

    .line 2175
    .line 2176
    .line 2177
    new-instance v1, Ljava/lang/StringBuilder;

    .line 2178
    .line 2179
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 2180
    .line 2181
    .line 2182
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getInt()I

    .line 2183
    .line 2184
    .line 2185
    move-result v5

    .line 2186
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2187
    .line 2188
    .line 2189
    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2190
    .line 2191
    .line 2192
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2193
    .line 2194
    .line 2195
    move-result-object v1

    .line 2196
    invoke-virtual {v0, v1}, Lcom/oplus/melody/btsdk/api/data/HearingEnhancementInfo;->setUid(Ljava/lang/String;)V

    .line 2197
    .line 2198
    .line 2199
    invoke-virtual {v4}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 2200
    .line 2201
    .line 2202
    move-result v1

    .line 2203
    if-eqz v1, :cond_8b2

    .line 2204
    .line 2205
    invoke-virtual {v4}, Ljava/nio/Buffer;->remaining()I

    .line 2206
    .line 2207
    .line 2208
    move-result v1

    .line 2209
    new-array v5, v1, [B

    .line 2210
    .line 2211
    const/4 v6, 0x0

    .line 2212
    invoke-virtual {v4, v5, v6, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 2213
    .line 2214
    .line 2215
    new-instance v1, Ljava/lang/String;

    .line 2216
    .line 2217
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    .line 2218
    .line 2219
    .line 2220
    move-result-object v4

    .line 2221
    invoke-direct {v1, v5, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 2222
    .line 2223
    .line 2224
    invoke-virtual {v0, v1}, Lcom/oplus/melody/btsdk/api/data/HearingEnhancementInfo;->setName(Ljava/lang/String;)V

    .line 2225
    .line 2226
    .line 2227
    :cond_8b2
    invoke-virtual {v0, v2}, Lcom/oplus/melody/btsdk/api/data/HearingEnhancementInfo;->setAddress(Ljava/lang/String;)V

    .line 2228
    .line 2229
    .line 2230
    new-instance v1, Landroid/util/Pair;

    .line 2231
    .line 2232
    invoke-direct {v1, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2233
    .line 2234
    .line 2235
    const/16 v4, 0x1b

    .line 2236
    .line 2237
    invoke-virtual {v3, v4, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2238
    .line 2239
    .line 2240
    move-result-object v0

    .line 2241
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V
    :try_end_8c3
    .catch Ljava/lang/Exception; {:try_start_84a .. :try_end_8c3} :catch_87b

    .line 2242
    .line 2243
    .line 2244
    goto :goto_8c9

    .line 2245
    :goto_8c4
    const-string v1, "handleRecvHearingEnhancementData"

    .line 2246
    .line 2247
    invoke-static {v14, v1, v0}, LQ8/a;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2248
    .line 2249
    .line 2250
    :cond_8c9
    :goto_8c9
    return-void

    .line 2251
    :pswitch_8ca
    move-object v3, v15

    .line 2252
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 2253
    .line 2254
    .line 2255
    move-result v0

    .line 2256
    if-eqz v0, :cond_8d5

    .line 2257
    .line 2258
    invoke-static {v0, v5, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 2259
    .line 2260
    .line 2261
    return-void

    .line 2262
    :cond_8d5
    array-length v0, v9

    .line 2263
    const/4 v1, 0x1

    .line 2264
    if-gt v0, v1, :cond_8ec

    .line 2265
    .line 2266
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2267
    .line 2268
    const-string v1, "handleReceiveCodecType\uff1ainvalid data length "

    .line 2269
    .line 2270
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2271
    .line 2272
    .line 2273
    array-length v1, v9

    .line 2274
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2275
    .line 2276
    .line 2277
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2278
    .line 2279
    .line 2280
    move-result-object v0

    .line 2281
    invoke-static {v14, v0, v2}, LQ8/a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2282
    .line 2283
    .line 2284
    return-void

    .line 2285
    :cond_8ec
    array-length v0, v9

    .line 2286
    if-gt v0, v1, :cond_8f6

    .line 2287
    .line 2288
    const-string v0, "The length of data is not valid when parse zenmode switch status"

    .line 2289
    .line 2290
    invoke-static {v6, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2291
    .line 2292
    .line 2293
    const/4 v0, -0x1

    .line 2294
    goto :goto_8f8

    .line 2295
    :cond_8f6
    aget-byte v0, v9, v1

    .line 2296
    .line 2297
    :goto_8f8
    new-instance v1, LAb/F;

    .line 2298
    .line 2299
    const/16 v4, 0x1a

    .line 2300
    .line 2301
    invoke-direct {v1, v0, v4}, LAb/F;-><init>(II)V

    .line 2302
    .line 2303
    .line 2304
    invoke-static {v14, v1, v2}, LQ8/a;->d(Ljava/lang/String;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 2305
    .line 2306
    .line 2307
    const/4 v4, -0x1

    .line 2308
    if-ne v0, v4, :cond_90b

    .line 2309
    .line 2310
    const-string v0, "Error when parse receive codec type command from the packet."

    .line 2311
    .line 2312
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2313
    .line 2314
    .line 2315
    return-void

    .line 2316
    :cond_90b
    const/16 v1, 0x35

    .line 2317
    .line 2318
    invoke-virtual {v3, v1, v0, v4, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 2319
    .line 2320
    .line 2321
    move-result-object v0

    .line 2322
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2323
    .line 2324
    .line 2325
    return-void

    .line 2326
    :pswitch_915
    move-object v3, v15

    .line 2327
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 2328
    .line 2329
    .line 2330
    move-result v0

    .line 2331
    if-eqz v0, :cond_922

    .line 2332
    .line 2333
    const-string v1, "handleRecvMultiConnectStateInfos The status is not success when receive ear in buds commadn. "

    .line 2334
    .line 2335
    invoke-static {v0, v1, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 2336
    .line 2337
    .line 2338
    return-void

    .line 2339
    :cond_922
    array-length v0, v9

    .line 2340
    const/4 v1, 0x1

    .line 2341
    if-gt v0, v1, :cond_92c

    .line 2342
    .line 2343
    const-string v0, "handleRecvMultiConnectStateInfos The length of data is 1, not valid when receive multiply connection info."

    .line 2344
    .line 2345
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2346
    .line 2347
    .line 2348
    return-void

    .line 2349
    :cond_92c
    invoke-static {v2, v1, v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->h(Ljava/lang/String;I[B)Lcom/oplus/melody/btsdk/api/data/MultiConnectInformations;

    .line 2350
    .line 2351
    .line 2352
    move-result-object v0

    .line 2353
    if-nez v0, :cond_938

    .line 2354
    .line 2355
    const-string v0, "handleRecvMultiConnectStateInfos parse connectState error, value is null"

    .line 2356
    .line 2357
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2358
    .line 2359
    .line 2360
    return-void

    .line 2361
    :cond_938
    const/16 v1, 0x22

    .line 2362
    .line 2363
    invoke-virtual {v3, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2364
    .line 2365
    .line 2366
    move-result-object v0

    .line 2367
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2368
    .line 2369
    .line 2370
    return-void

    .line 2371
    :pswitch_942
    move-object v3, v15

    .line 2372
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 2373
    .line 2374
    .line 2375
    move-result v0

    .line 2376
    if-eqz v0, :cond_94f

    .line 2377
    .line 2378
    const-string v1, "Status is failed when receive equalizer mode command. status = "

    .line 2379
    .line 2380
    invoke-static {v0, v1, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 2381
    .line 2382
    .line 2383
    return-void

    .line 2384
    :cond_94f
    array-length v0, v9

    .line 2385
    const/4 v1, 0x1

    .line 2386
    if-gt v0, v1, :cond_959

    .line 2387
    .line 2388
    const-string v0, "The length of data is 1, not valid when receive equalizer mode command."

    .line 2389
    .line 2390
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2391
    .line 2392
    .line 2393
    return-void

    .line 2394
    :cond_959
    new-instance v0, Lcom/oplus/melody/btsdk/api/data/EqualizerModeInfo;

    .line 2395
    .line 2396
    invoke-direct {v0, v1, v9}, Lcom/oplus/melody/btsdk/api/data/EqualizerModeInfo;-><init>(I[B)V

    .line 2397
    .line 2398
    .line 2399
    new-instance v1, Landroid/util/Pair;

    .line 2400
    .line 2401
    invoke-direct {v1, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2402
    .line 2403
    .line 2404
    const/16 v4, 0x18

    .line 2405
    .line 2406
    invoke-virtual {v3, v4, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2407
    .line 2408
    .line 2409
    move-result-object v0

    .line 2410
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2411
    .line 2412
    .line 2413
    return-void

    .line 2414
    :pswitch_96d
    move-object v3, v15

    .line 2415
    const-string v0, "handleRecvFeatureSwitchStatus"

    .line 2416
    .line 2417
    invoke-static {v14, v0}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 2418
    .line 2419
    .line 2420
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 2421
    .line 2422
    .line 2423
    move-result v0

    .line 2424
    if-eqz v0, :cond_97f

    .line 2425
    .line 2426
    const-string v1, "Status is failed when receive remote Earbuds feature switch status command. status = "

    .line 2427
    .line 2428
    invoke-static {v0, v1, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 2429
    .line 2430
    .line 2431
    return-void

    .line 2432
    :cond_97f
    array-length v0, v9

    .line 2433
    const/4 v1, 0x1

    .line 2434
    if-gt v0, v1, :cond_996

    .line 2435
    .line 2436
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2437
    .line 2438
    const-string v1, "handleRecvFeatureSwitchStatus\uff1ainvalid data length "

    .line 2439
    .line 2440
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2441
    .line 2442
    .line 2443
    array-length v1, v9

    .line 2444
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 2445
    .line 2446
    .line 2447
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2448
    .line 2449
    .line 2450
    move-result-object v0

    .line 2451
    invoke-static {v14, v0, v2}, LQ8/a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2452
    .line 2453
    .line 2454
    return-void

    .line 2455
    :cond_996
    invoke-static {v1, v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->i(I[B)Ljava/util/ArrayList;

    .line 2456
    .line 2457
    .line 2458
    move-result-object v0

    .line 2459
    if-nez v0, :cond_9a2

    .line 2460
    .line 2461
    const-string v0, "Error when parse feature switch status information from the packet."

    .line 2462
    .line 2463
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2464
    .line 2465
    .line 2466
    return-void

    .line 2467
    :cond_9a2
    new-instance v1, LFa/A;

    .line 2468
    .line 2469
    const/4 v5, 0x3

    .line 2470
    invoke-direct {v1, v0, v5}, LFa/A;-><init>(Ljava/util/ArrayList;I)V

    .line 2471
    .line 2472
    .line 2473
    invoke-static {v14, v1, v2}, LQ8/a;->d(Ljava/lang/String;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 2474
    .line 2475
    .line 2476
    new-instance v1, Landroid/util/Pair;

    .line 2477
    .line 2478
    invoke-direct {v1, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2479
    .line 2480
    .line 2481
    const/16 v0, 0x12

    .line 2482
    .line 2483
    invoke-virtual {v3, v0, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2484
    .line 2485
    .line 2486
    move-result-object v0

    .line 2487
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2488
    .line 2489
    .line 2490
    return-void

    .line 2491
    :pswitch_9ba
    move-object v3, v15

    .line 2492
    iget-object v0, v0, Lw8/a;->d:[B

    .line 2493
    .line 2494
    invoke-static {v0}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 2495
    .line 2496
    .line 2497
    move-result v1

    .line 2498
    if-eqz v1, :cond_9ca

    .line 2499
    .line 2500
    const-string v0, "Status is failed when receive remote Earbuds noise reduction mode command. status = "

    .line 2501
    .line 2502
    invoke-static {v1, v0, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 2503
    .line 2504
    .line 2505
    goto/16 :goto_a84

    .line 2506
    .line 2507
    :cond_9ca
    array-length v1, v0

    .line 2508
    const/4 v4, 0x1

    .line 2509
    if-gt v1, v4, :cond_9d5

    .line 2510
    .line 2511
    const-string v0, "The length of data is 1, not valid when receive Earbuds noise reduction mode."

    .line 2512
    .line 2513
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2514
    .line 2515
    .line 2516
    goto/16 :goto_a84

    .line 2517
    .line 2518
    :cond_9d5
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 2519
    .line 2520
    .line 2521
    move-result-object v1

    .line 2522
    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 2523
    .line 2524
    .line 2525
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B

    .line 2526
    .line 2527
    .line 2528
    move-result v1

    .line 2529
    const/4 v13, 0x2

    .line 2530
    if-ne v1, v13, :cond_a0a

    .line 2531
    .line 2532
    new-instance v1, Lcom/oplus/melody/btsdk/api/data/NoiseReductionInfo;

    .line 2533
    .line 2534
    invoke-direct {v1, v4, v0}, Lcom/oplus/melody/btsdk/api/data/NoiseReductionInfo;-><init>(I[B)V

    .line 2535
    .line 2536
    .line 2537
    sget-object v0, LQ8/a;->a:Lcom/oplus/melody/common/util/y$a;

    .line 2538
    .line 2539
    invoke-static {}, Lcom/oplus/melody/common/util/y;->l()Z

    .line 2540
    .line 2541
    .line 2542
    move-result v0

    .line 2543
    if-eqz v0, :cond_9fa

    .line 2544
    .line 2545
    new-instance v0, LX7/b;

    .line 2546
    .line 2547
    const/16 v4, 0xd

    .line 2548
    .line 2549
    invoke-direct {v0, v1, v4}, LX7/b;-><init>(Ljava/lang/Object;I)V

    .line 2550
    .line 2551
    .line 2552
    invoke-static {v14, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2553
    .line 2554
    .line 2555
    :cond_9fa
    new-instance v0, Landroid/util/Pair;

    .line 2556
    .line 2557
    invoke-direct {v0, v2, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2558
    .line 2559
    .line 2560
    const/16 v1, 0x14

    .line 2561
    .line 2562
    invoke-virtual {v3, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2563
    .line 2564
    .line 2565
    move-result-object v0

    .line 2566
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2567
    .line 2568
    .line 2569
    goto/16 :goto_a84

    .line 2570
    .line 2571
    :cond_a0a
    if-ne v1, v4, :cond_a33

    .line 2572
    .line 2573
    new-instance v1, Lcom/oplus/melody/btsdk/api/data/CurrentNoiseModeInfo;

    .line 2574
    .line 2575
    const/4 v13, 0x2

    .line 2576
    invoke-direct {v1, v13, v0}, Lcom/oplus/melody/btsdk/api/data/CurrentNoiseModeInfo;-><init>(I[B)V

    .line 2577
    .line 2578
    .line 2579
    sget-object v0, LQ8/a;->a:Lcom/oplus/melody/common/util/y$a;

    .line 2580
    .line 2581
    invoke-static {}, Lcom/oplus/melody/common/util/y;->l()Z

    .line 2582
    .line 2583
    .line 2584
    move-result v0

    .line 2585
    if-eqz v0, :cond_a24

    .line 2586
    .line 2587
    new-instance v0, LUb/a;

    .line 2588
    .line 2589
    const/16 v4, 0x10

    .line 2590
    .line 2591
    invoke-direct {v0, v1, v4}, LUb/a;-><init>(Ljava/lang/Object;I)V

    .line 2592
    .line 2593
    .line 2594
    invoke-static {v14, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2595
    .line 2596
    .line 2597
    :cond_a24
    new-instance v0, Landroid/util/Pair;

    .line 2598
    .line 2599
    invoke-direct {v0, v2, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2600
    .line 2601
    .line 2602
    const/16 v1, 0x17

    .line 2603
    .line 2604
    invoke-virtual {v3, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2605
    .line 2606
    .line 2607
    move-result-object v0

    .line 2608
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2609
    .line 2610
    .line 2611
    goto :goto_a84

    .line 2612
    :cond_a33
    const/4 v5, 0x3

    .line 2613
    if-ne v1, v5, :cond_a5b

    .line 2614
    .line 2615
    new-instance v1, Lcom/oplus/melody/btsdk/api/data/NoiseReductionInfo;

    .line 2616
    .line 2617
    const/4 v4, 0x1

    .line 2618
    invoke-direct {v1, v4, v0}, Lcom/oplus/melody/btsdk/api/data/NoiseReductionInfo;-><init>(I[B)V

    .line 2619
    .line 2620
    .line 2621
    sget-object v0, LQ8/a;->a:Lcom/oplus/melody/common/util/y$a;

    .line 2622
    .line 2623
    invoke-static {}, Lcom/oplus/melody/common/util/y;->l()Z

    .line 2624
    .line 2625
    .line 2626
    move-result v0

    .line 2627
    if-eqz v0, :cond_a4c

    .line 2628
    .line 2629
    new-instance v0, Lcom/oplus/melody/btsdk/protocol/commands/h;

    .line 2630
    .line 2631
    invoke-direct {v0, v1, v4}, Lcom/oplus/melody/btsdk/protocol/commands/h;-><init>(Lcom/oplus/melody/btsdk/api/data/NoiseReductionInfo;I)V

    .line 2632
    .line 2633
    .line 2634
    invoke-static {v14, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2635
    .line 2636
    .line 2637
    :cond_a4c
    new-instance v0, Landroid/util/Pair;

    .line 2638
    .line 2639
    invoke-direct {v0, v2, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2640
    .line 2641
    .line 2642
    const/16 v1, 0x1f

    .line 2643
    .line 2644
    invoke-virtual {v3, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2645
    .line 2646
    .line 2647
    move-result-object v0

    .line 2648
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2649
    .line 2650
    .line 2651
    goto :goto_a84

    .line 2652
    :cond_a5b
    const/4 v5, 0x4

    .line 2653
    if-ne v1, v5, :cond_a84

    .line 2654
    .line 2655
    new-instance v1, Lcom/oplus/melody/btsdk/api/data/IntelligentNoiseModeInfo;

    .line 2656
    .line 2657
    const/4 v13, 0x2

    .line 2658
    invoke-direct {v1, v13, v0}, Lcom/oplus/melody/btsdk/api/data/IntelligentNoiseModeInfo;-><init>(I[B)V

    .line 2659
    .line 2660
    .line 2661
    sget-object v0, LQ8/a;->a:Lcom/oplus/melody/common/util/y$a;

    .line 2662
    .line 2663
    invoke-static {}, Lcom/oplus/melody/common/util/y;->l()Z

    .line 2664
    .line 2665
    .line 2666
    move-result v0

    .line 2667
    if-eqz v0, :cond_a76

    .line 2668
    .line 2669
    new-instance v0, La8/c;

    .line 2670
    .line 2671
    const/16 v4, 0xd

    .line 2672
    .line 2673
    invoke-direct {v0, v1, v4}, La8/c;-><init>(Ljava/lang/Object;I)V

    .line 2674
    .line 2675
    .line 2676
    invoke-static {v14, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2677
    .line 2678
    .line 2679
    :cond_a76
    new-instance v0, Landroid/util/Pair;

    .line 2680
    .line 2681
    invoke-direct {v0, v2, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2682
    .line 2683
    .line 2684
    const/16 v1, 0x2c

    .line 2685
    .line 2686
    invoke-virtual {v3, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2687
    .line 2688
    .line 2689
    move-result-object v0

    .line 2690
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2691
    .line 2692
    .line 2693
    :cond_a84
    :goto_a84
    return-void

    .line 2694
    :pswitch_a85
    move-object v3, v15

    .line 2695
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 2696
    .line 2697
    .line 2698
    move-result v0

    .line 2699
    if-eqz v0, :cond_a92

    .line 2700
    .line 2701
    const-string v1, "handleRecvEarBudsColorID Status is failed when receive Earbuds colorID command. status = "

    .line 2702
    .line 2703
    invoke-static {v0, v1, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 2704
    .line 2705
    .line 2706
    return-void

    .line 2707
    :cond_a92
    array-length v0, v9

    .line 2708
    const/4 v1, 0x1

    .line 2709
    if-gt v0, v1, :cond_a9c

    .line 2710
    .line 2711
    const-string v0, "handleRecvEarBudsColorID The length of data is 1, not valid when receive Earbuds colorID."

    .line 2712
    .line 2713
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2714
    .line 2715
    .line 2716
    return-void

    .line 2717
    :cond_a9c
    const/4 v6, 0x0

    .line 2718
    invoke-static {v9, v1, v1, v6}, Ln7/d;->d([BIIZ)I

    .line 2719
    .line 2720
    .line 2721
    move-result v0

    .line 2722
    new-instance v1, Lcom/oplus/melody/btsdk/protocol/commands/j;

    .line 2723
    .line 2724
    invoke-direct {v1, v0, v6}, Lcom/oplus/melody/btsdk/protocol/commands/j;-><init>(II)V

    .line 2725
    .line 2726
    .line 2727
    invoke-static {v14, v1}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2728
    .line 2729
    .line 2730
    const/16 v1, 0x11

    .line 2731
    .line 2732
    const/4 v4, -0x1

    .line 2733
    invoke-virtual {v3, v1, v0, v4, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 2734
    .line 2735
    .line 2736
    move-result-object v0

    .line 2737
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2738
    .line 2739
    .line 2740
    return-void

    .line 2741
    :pswitch_ab4
    move-object v3, v15

    .line 2742
    invoke-static {v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 2743
    .line 2744
    .line 2745
    move-result v0

    .line 2746
    if-eqz v0, :cond_ac1

    .line 2747
    .line 2748
    const-string v1, "handleRecvEarBudsStatus The status is not success when receive ear in buds command. "

    .line 2749
    .line 2750
    invoke-static {v0, v1, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 2751
    .line 2752
    .line 2753
    return-void

    .line 2754
    :cond_ac1
    const/4 v1, 0x1

    .line 2755
    invoke-static {v1, v9}, Lcom/oplus/melody/btsdk/protocol/commands/e;->e(I[B)Ljava/util/ArrayList;

    .line 2756
    .line 2757
    .line 2758
    move-result-object v0

    .line 2759
    if-nez v0, :cond_ace

    .line 2760
    .line 2761
    const-string v0, "handleRecvEarBudsStatus Error, when receive ear buds status."

    .line 2762
    .line 2763
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2764
    .line 2765
    .line 2766
    return-void

    .line 2767
    :cond_ace
    sget-object v1, LQ8/a;->a:Lcom/oplus/melody/common/util/y$a;

    .line 2768
    .line 2769
    invoke-static {}, Lcom/oplus/melody/common/util/y;->l()Z

    .line 2770
    .line 2771
    .line 2772
    move-result v1

    .line 2773
    if-eqz v1, :cond_adf

    .line 2774
    .line 2775
    new-instance v1, LFa/C;

    .line 2776
    .line 2777
    const/4 v5, 0x4

    .line 2778
    invoke-direct {v1, v0, v5}, LFa/C;-><init>(Ljava/util/ArrayList;I)V

    .line 2779
    .line 2780
    .line 2781
    invoke-static {v14, v1, v2}, LQ8/a;->d(Ljava/lang/String;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 2782
    .line 2783
    .line 2784
    :cond_adf
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 2785
    .line 2786
    .line 2787
    move-result v1

    .line 2788
    if-eqz v1, :cond_ae7

    .line 2789
    .line 2790
    :cond_ae5
    const/4 v8, 0x3

    .line 2791
    goto :goto_b00

    .line 2792
    :cond_ae7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 2793
    .line 2794
    .line 2795
    move-result v1

    .line 2796
    const/4 v4, 0x0

    .line 2797
    :cond_aec
    if-ge v4, v1, :cond_ae5

    .line 2798
    .line 2799
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2800
    .line 2801
    .line 2802
    move-result-object v5

    .line 2803
    const/16 v25, 0x1

    .line 2804
    .line 2805
    add-int/lit8 v4, v4, 0x1

    .line 2806
    .line 2807
    check-cast v5, Lcom/oplus/melody/btsdk/api/data/StatusInfo;

    .line 2808
    .line 2809
    invoke-virtual {v5}, Lcom/oplus/melody/btsdk/api/data/StatusInfo;->getDeviceType()I

    .line 2810
    .line 2811
    .line 2812
    move-result v5

    .line 2813
    const/4 v8, 0x3

    .line 2814
    if-ne v5, v8, :cond_aec

    .line 2815
    .line 2816
    goto :goto_b14

    .line 2817
    :goto_b00
    const-string v1, "handleRecvEarBudsStatus not contain box status, add def box status."

    .line 2818
    .line 2819
    invoke-static {v14, v1}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 2820
    .line 2821
    .line 2822
    new-instance v1, Lcom/oplus/melody/btsdk/api/data/StatusInfo;

    .line 2823
    .line 2824
    invoke-direct {v1}, Lcom/oplus/melody/btsdk/api/data/StatusInfo;-><init>()V

    .line 2825
    .line 2826
    .line 2827
    invoke-virtual {v1, v8}, Lcom/oplus/melody/btsdk/api/data/StatusInfo;->setDeviceType(I)V

    .line 2828
    .line 2829
    .line 2830
    const/4 v6, 0x0

    .line 2831
    invoke-virtual {v1, v6}, Lcom/oplus/melody/btsdk/api/data/StatusInfo;->setBoxCoverClosed(Z)V

    .line 2832
    .line 2833
    .line 2834
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2835
    .line 2836
    .line 2837
    :goto_b14
    new-instance v1, Landroid/util/Pair;

    .line 2838
    .line 2839
    invoke-direct {v1, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2840
    .line 2841
    .line 2842
    const/16 v4, 0xc

    .line 2843
    .line 2844
    invoke-virtual {v3, v4, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2845
    .line 2846
    .line 2847
    move-result-object v0

    .line 2848
    const v1, 0x8109

    .line 2849
    .line 2850
    .line 2851
    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 2852
    .line 2853
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2854
    .line 2855
    .line 2856
    return-void

    .line 2857
    :pswitch_b28
    move-object v3, v15

    .line 2858
    iget-object v0, v0, Lw8/a;->d:[B

    .line 2859
    .line 2860
    invoke-static {v0}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 2861
    .line 2862
    .line 2863
    move-result v1

    .line 2864
    if-eqz v1, :cond_b37

    .line 2865
    .line 2866
    const-string v0, "The status failed when receive function key."

    .line 2867
    .line 2868
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2869
    .line 2870
    .line 2871
    goto :goto_b94

    .line 2872
    :cond_b37
    array-length v1, v0

    .line 2873
    const/4 v4, 0x1

    .line 2874
    if-gt v1, v4, :cond_b41

    .line 2875
    .line 2876
    const-string v0, "The length is not valid when receive function key"

    .line 2877
    .line 2878
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2879
    .line 2880
    .line 2881
    goto :goto_b94

    .line 2882
    :cond_b41
    aget-byte v1, v0, v4

    .line 2883
    .line 2884
    and-int/lit16 v1, v1, 0xff

    .line 2885
    .line 2886
    array-length v4, v0

    .line 2887
    const/16 v20, 0x4

    .line 2888
    .line 2889
    mul-int/lit8 v11, v1, 0x4

    .line 2890
    .line 2891
    const/16 v24, 0x2

    .line 2892
    .line 2893
    add-int/lit8 v11, v11, 0x2

    .line 2894
    .line 2895
    if-lt v4, v11, :cond_b8b

    .line 2896
    .line 2897
    if-nez v1, :cond_b53

    .line 2898
    .line 2899
    goto :goto_b8b

    .line 2900
    :cond_b53
    new-instance v4, Ljava/util/ArrayList;

    .line 2901
    .line 2902
    invoke-direct {v4, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2903
    .line 2904
    .line 2905
    const/4 v5, 0x0

    .line 2906
    const/4 v6, 0x2

    .line 2907
    :goto_b5a
    if-ge v5, v1, :cond_b6d

    .line 2908
    .line 2909
    new-instance v7, Lcom/oplus/melody/btsdk/api/data/KeyFunctionInfo;

    .line 2910
    .line 2911
    invoke-direct {v7, v6, v0}, Lcom/oplus/melody/btsdk/api/data/KeyFunctionInfo;-><init>(I[B)V

    .line 2912
    .line 2913
    .line 2914
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2915
    .line 2916
    .line 2917
    const/16 v20, 0x4

    .line 2918
    .line 2919
    add-int/lit8 v6, v6, 0x4

    .line 2920
    .line 2921
    const/16 v25, 0x1

    .line 2922
    .line 2923
    add-int/lit8 v5, v5, 0x1

    .line 2924
    .line 2925
    goto :goto_b5a

    .line 2926
    :cond_b6d
    sget-object v0, LQ8/a;->a:Lcom/oplus/melody/common/util/y$a;

    .line 2927
    .line 2928
    invoke-static {}, Lcom/oplus/melody/common/util/y;->l()Z

    .line 2929
    .line 2930
    .line 2931
    move-result v0

    .line 2932
    if-eqz v0, :cond_b7e

    .line 2933
    .line 2934
    new-instance v0, LFa/A;

    .line 2935
    .line 2936
    const/4 v13, 0x2

    .line 2937
    invoke-direct {v0, v4, v13}, LFa/A;-><init>(Ljava/util/ArrayList;I)V

    .line 2938
    .line 2939
    .line 2940
    invoke-static {v14, v0}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2941
    .line 2942
    .line 2943
    :cond_b7e
    new-instance v0, Landroid/util/Pair;

    .line 2944
    .line 2945
    invoke-direct {v0, v2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2946
    .line 2947
    .line 2948
    invoke-virtual {v3, v8, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 2949
    .line 2950
    .line 2951
    move-result-object v0

    .line 2952
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2953
    .line 2954
    .line 2955
    goto :goto_b94

    .line 2956
    :cond_b8b
    :goto_b8b
    new-instance v2, Lcom/oplus/melody/btsdk/protocol/commands/k;

    .line 2957
    .line 2958
    const/4 v6, 0x0

    .line 2959
    invoke-direct {v2, v1, v6, v0}, Lcom/oplus/melody/btsdk/protocol/commands/k;-><init>(II[B)V

    .line 2960
    .line 2961
    .line 2962
    invoke-static {v14, v2}, LQ8/a;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 2963
    .line 2964
    .line 2965
    :goto_b94
    return-void

    .line 2966
    :pswitch_b95
    invoke-virtual/range {p0 .. p2}, Lcom/oplus/melody/btsdk/protocol/commands/m;->L(Ljava/lang/String;Lw8/a;)V

    .line 2967
    .line 2968
    .line 2969
    return-void

    .line 2970
    :pswitch_b99
    move-object v3, v15

    .line 2971
    iget-object v0, v0, Lw8/a;->d:[B

    .line 2972
    .line 2973
    invoke-static {v0}, Lcom/oplus/melody/btsdk/protocol/commands/e;->l([B)I

    .line 2974
    .line 2975
    .line 2976
    move-result v1

    .line 2977
    if-eqz v1, :cond_ba8

    .line 2978
    .line 2979
    const-string v0, "Status is not success when receive battery level."

    .line 2980
    .line 2981
    invoke-static {v1, v0, v14}, Leb/J;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 2982
    .line 2983
    .line 2984
    goto :goto_bd4

    .line 2985
    :cond_ba8
    const/4 v1, 0x1

    .line 2986
    invoke-static {v1, v0}, Lcom/oplus/melody/btsdk/protocol/commands/e;->d(I[B)Ljava/util/ArrayList;

    .line 2987
    .line 2988
    .line 2989
    move-result-object v0

    .line 2990
    if-nez v0, :cond_bb5

    .line 2991
    .line 2992
    const-string v0, "Error when parse battery information from the packet."

    .line 2993
    .line 2994
    invoke-static {v14, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 2995
    .line 2996
    .line 2997
    goto :goto_bd4

    .line 2998
    :cond_bb5
    sget-object v1, LQ8/a;->a:Lcom/oplus/melody/common/util/y$a;

    .line 2999
    .line 3000
    invoke-static {}, Lcom/oplus/melody/common/util/y;->l()Z

    .line 3001
    .line 3002
    .line 3003
    move-result v1

    .line 3004
    if-eqz v1, :cond_bc6

    .line 3005
    .line 3006
    new-instance v1, LC9/f;

    .line 3007
    .line 3008
    const/4 v7, 0x6

    .line 3009
    invoke-direct {v1, v0, v7}, LC9/f;-><init>(Ljava/util/ArrayList;I)V

    .line 3010
    .line 3011
    .line 3012
    invoke-static {v14, v1, v2}, LQ8/a;->d(Ljava/lang/String;Ljava/util/function/Supplier;Ljava/lang/String;)V

    .line 3013
    .line 3014
    .line 3015
    :cond_bc6
    new-instance v1, Landroid/util/Pair;

    .line 3016
    .line 3017
    invoke-direct {v1, v2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3018
    .line 3019
    .line 3020
    const/16 v0, 0xa

    .line 3021
    .line 3022
    invoke-virtual {v3, v0, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 3023
    .line 3024
    .line 3025
    move-result-object v0

    .line 3026
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 3027
    .line 3028
    .line 3029
    :goto_bd4
    return-void

    .line 3030
    :pswitch_bd5
    invoke-virtual/range {p0 .. p2}, Lcom/oplus/melody/btsdk/protocol/commands/m;->K(Ljava/lang/String;Lw8/a;)V

    .line 3031
    .line 3032
    .line 3033
    return-void

    .line 3034
    :pswitch_bd9
    invoke-static {v0}, Lcom/oplus/melody/btsdk/protocol/commands/m;->F(Lw8/a;)V

    .line 3035
    .line 3036
    .line 3037
    return-void

    .line 3038
    :pswitch_bdd
    invoke-virtual/range {p0 .. p2}, Lcom/oplus/melody/btsdk/protocol/commands/m;->I(Ljava/lang/String;Lw8/a;)V

    .line 3039
    .line 3040
    .line 3041
    return-void

    .line 3042
    :pswitch_be1
    invoke-static {v0}, Lcom/oplus/melody/btsdk/protocol/commands/m;->J(Lw8/a;)V

    .line 3043
    .line 3044
    .line 3045
    return-void

    .line 3046
    :pswitch_be5
    invoke-virtual/range {p0 .. p2}, Lcom/oplus/melody/btsdk/protocol/commands/m;->H(Ljava/lang/String;Lw8/a;)V

    .line 3047
    .line 3048
    .line 3049
    return-void

    .line 3050
    :pswitch_be9
    move-object v3, v15

    .line 3051
    invoke-virtual/range {p0 .. p2}, Lcom/oplus/melody/btsdk/protocol/commands/m;->G(Ljava/lang/String;Lw8/a;)Z

    .line 3052
    .line 3053
    .line 3054
    move-result v0

    .line 3055
    if-nez v0, :cond_bf4

    .line 3056
    .line 3057
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->w(Ljava/lang/String;)V

    .line 3058
    .line 3059
    .line 3060
    return-void

    .line 3061
    :cond_bf4
    invoke-static {v2}, Lv8/a;->c(Ljava/lang/String;)V

    .line 3062
    .line 3063
    .line 3064
    const/4 v5, 0x7

    .line 3065
    invoke-virtual {v3, v5, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 3066
    .line 3067
    .line 3068
    move-result-object v0

    .line 3069
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 3070
    .line 3071
    .line 3072
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->z(Ljava/lang/String;)V

    .line 3073
    .line 3074
    .line 3075
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->e(Ljava/lang/String;)Z

    .line 3076
    .line 3077
    .line 3078
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->i(Ljava/lang/String;)V

    .line 3079
    .line 3080
    .line 3081
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->y(Ljava/lang/String;)V

    .line 3082
    .line 3083
    .line 3084
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->x(Ljava/lang/String;)V

    .line 3085
    .line 3086
    .line 3087
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->f(Ljava/lang/String;)Z

    .line 3088
    .line 3089
    .line 3090
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->A(Ljava/lang/String;)Z

    .line 3091
    .line 3092
    .line 3093
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->E(Ljava/lang/String;)Z

    .line 3094
    .line 3095
    .line 3096
    const/16 v0, 0x108

    .line 3097
    .line 3098
    move-object/from16 v1, p0

    .line 3099
    .line 3100
    invoke-virtual {v1, v0, v2}, Lcom/oplus/melody/btsdk/protocol/commands/m;->t(ILjava/lang/String;)Z

    .line 3101
    .line 3102
    .line 3103
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->v(Ljava/lang/String;)V

    .line 3104
    .line 3105
    .line 3106
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->h(Ljava/lang/String;)V

    .line 3107
    .line 3108
    .line 3109
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->C(Ljava/lang/String;)V

    .line 3110
    .line 3111
    .line 3112
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->s(Ljava/lang/String;)V

    .line 3113
    .line 3114
    .line 3115
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->g(Ljava/lang/String;)Z

    .line 3116
    .line 3117
    .line 3118
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->n(Ljava/lang/String;)Z

    .line 3119
    .line 3120
    .line 3121
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->m(Ljava/lang/String;)V

    .line 3122
    .line 3123
    .line 3124
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->l(Ljava/lang/String;)Z

    .line 3125
    .line 3126
    .line 3127
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->r(Ljava/lang/String;)Z

    .line 3128
    .line 3129
    .line 3130
    const/4 v4, 0x1

    .line 3131
    new-array v0, v4, [B

    .line 3132
    .line 3133
    const/16 v21, 0x0

    .line 3134
    .line 3135
    aput-byte v4, v0, v21

    .line 3136
    .line 3137
    invoke-virtual {v1, v2, v0}, Lcom/oplus/melody/btsdk/protocol/commands/m;->j(Ljava/lang/String;[B)V

    .line 3138
    .line 3139
    .line 3140
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->c(Ljava/lang/String;)V

    .line 3141
    .line 3142
    .line 3143
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->D(Ljava/lang/String;)V

    .line 3144
    .line 3145
    .line 3146
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->B(Ljava/lang/String;)V

    .line 3147
    .line 3148
    .line 3149
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->p(Ljava/lang/String;)V

    .line 3150
    .line 3151
    .line 3152
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 3153
    .line 3154
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->O(Ljava/lang/String;)V

    .line 3155
    .line 3156
    .line 3157
    sget-object v0, Lv8/a;->c:Ljava/util/LinkedHashMap;

    .line 3158
    .line 3159
    invoke-virtual {v0, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3160
    .line 3161
    .line 3162
    move-result-object v0

    .line 3163
    if-eqz v0, :cond_c6e

    .line 3164
    .line 3165
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->b(Ljava/lang/String;)V

    .line 3166
    .line 3167
    .line 3168
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->q(Ljava/lang/String;)Z

    .line 3169
    .line 3170
    .line 3171
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->k(Ljava/lang/String;)Z

    .line 3172
    .line 3173
    .line 3174
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->o(Ljava/lang/String;)Z

    .line 3175
    .line 3176
    .line 3177
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->d(Ljava/lang/String;)Z

    .line 3178
    .line 3179
    .line 3180
    invoke-virtual/range {p0 .. p1}, Lcom/oplus/melody/btsdk/protocol/commands/m;->u(Ljava/lang/String;)Z

    .line 3181
    .line 3182
    .line 3183
    :cond_c6e
    return-void

    .line 3184
    nop

    .line 3185
    :pswitch_data_c70
    .packed-switch 0x8100
        :pswitch_be9
        :pswitch_be5
        :pswitch_be1
        :pswitch_bdd
        :pswitch_bd9
        :pswitch_bd5
        :pswitch_b99
        :pswitch_b95
        :pswitch_b28
        :pswitch_ab4
        :pswitch_29
        :pswitch_a85
        :pswitch_9ba
        :pswitch_96d
        :pswitch_29
        :pswitch_942
        :pswitch_29
        :pswitch_29
        :pswitch_915
        :pswitch_29
        :pswitch_8ca
        :pswitch_831
        :pswitch_7ff
        :pswitch_72e
        :pswitch_6c8
        :pswitch_670
        :pswitch_645
        :pswitch_29
        :pswitch_61a
        :pswitch_5ed
        :pswitch_5bb
        :pswitch_477
        :pswitch_29
        :pswitch_44f
        :pswitch_41f
        :pswitch_38d
        :pswitch_34e
        :pswitch_2cd
        :pswitch_29
        :pswitch_299
        :pswitch_29
        :pswitch_265
        :pswitch_231
        :pswitch_1d9
        :pswitch_29
        :pswitch_29
        :pswitch_1a5
        :pswitch_29
        :pswitch_175
        :pswitch_145
        :pswitch_11c
        :pswitch_d9
        :pswitch_9a
        :pswitch_73
        :pswitch_2b
    .end packed-switch

    .line 3186
    .line 3187
    .line 3188
    .line 3189
    .line 3190
    .line 3191
    .line 3192
    .line 3193
    .line 3194
    .line 3195
    .line 3196
    .line 3197
    .line 3198
    .line 3199
    .line 3200
    .line 3201
    .line 3202
    .line 3203
    .line 3204
    .line 3205
    .line 3206
    .line 3207
    .line 3208
    .line 3209
    .line 3210
    .line 3211
    .line 3212
    .line 3213
    .line 3214
    .line 3215
    .line 3216
    .line 3217
    .line 3218
    .line 3219
    .line 3220
    .line 3221
    .line 3222
    .line 3223
    .line 3224
    .line 3225
    .line 3226
    .line 3227
    .line 3228
    .line 3229
    .line 3230
    .line 3231
    .line 3232
    .line 3233
    .line 3234
    .line 3235
    .line 3236
    .line 3237
    .line 3238
    .line 3239
    .line 3240
    .line 3241
    .line 3242
    .line 3243
    .line 3244
    .line 3245
    .line 3246
    .line 3247
    .line 3248
    .line 3249
    .line 3250
    .line 3251
    .line 3252
    .line 3253
    .line 3254
    .line 3255
    .line 3256
    .line 3257
    .line 3258
    .line 3259
    .line 3260
    .line 3261
    .line 3262
    .line 3263
    .line 3264
    .line 3265
    .line 3266
    .line 3267
    .line 3268
    .line 3269
    .line 3270
    .line 3271
    .line 3272
    .line 3273
    .line 3274
    .line 3275
    .line 3276
    .line 3277
    .line 3278
    .line 3279
    .line 3280
    .line 3281
    .line 3282
    .line 3283
    .line 3284
    .line 3285
    .line 3286
    .line 3287
    .line 3288
    .line 3289
    .line 3290
    .line 3291
    .line 3292
    .line 3293
    .line 3294
    .line 3295
    .line 3296
    .line 3297
    .line 3298
    .line 3299
    :array_ce2
    .array-data 4
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
    .end array-data
.end method
