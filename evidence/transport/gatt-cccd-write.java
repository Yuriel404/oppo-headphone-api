.method public final run()V
    .registers 45

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    iget v4, v1, LAb/O;->a:I

    .line 7
    .line 8
    packed-switch v4, :pswitch_data_660

    .line 9
    .line 10
    .line 11
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 12
    .line 13
    move-object v4, v0

    .line 14
    check-cast v4, Landroidx/media3/session/J0;

    .line 15
    .line 16
    iget-object v5, v4, Landroidx/media3/session/J0;->h:Landroidx/media3/session/X0;

    .line 17
    .line 18
    iget-object v0, v1, LAb/O;->c:Ljava/lang/Object;

    .line 19
    .line 20
    move-object v6, v0

    .line 21
    check-cast v6, Landroidx/media3/session/A1;

    .line 22
    .line 23
    iput-object v6, v4, Landroidx/media3/session/J0;->t:Landroidx/media3/session/A1;

    .line 24
    .line 25
    new-instance v0, Landroidx/media3/session/J0$d;

    .line 26
    .line 27
    invoke-direct {v0, v4, v6}, Landroidx/media3/session/J0$d;-><init>(Landroidx/media3/session/J0;Landroidx/media3/session/A1;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v6, v0}, Landroidx/media3/session/A1;->N(LY/A$c;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, v4, Landroidx/media3/session/J0;->v:Landroidx/media3/session/J0$d;

    .line 34
    .line 35
    :try_start_22
    iget-object v0, v5, Landroidx/media3/session/X0;->i:Landroidx/media3/session/X0$d;

    .line 36
    .line 37
    invoke-virtual {v0, v2, v6}, Landroidx/media3/session/X0$d;->k(ILandroidx/media3/session/A1;)V
    :try_end_27
    .catch Landroid/os/RemoteException; {:try_start_22 .. :try_end_27} :catch_28

    .line 38
    .line 39
    .line 40
    goto :goto_30

    .line 41
    :catch_28
    move-exception v0

    .line 42
    const-string v7, "MediaSessionImpl"

    .line 43
    .line 44
    const-string v8, "Exception in using media1 API"

    .line 45
    .line 46
    invoke-static {v7, v8, v0}, Lb0/o;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    :goto_30
    iget-object v0, v5, Landroidx/media3/session/X0;->m:Landroidx/media3/session/legacy/MediaSessionCompat;

    .line 50
    .line 51
    iget-object v0, v0, Landroidx/media3/session/legacy/MediaSessionCompat;->a:Landroidx/media3/session/legacy/MediaSessionCompat$d;

    .line 52
    .line 53
    iget-object v0, v0, Landroidx/media3/session/legacy/MediaSessionCompat$d;->a:Landroid/media/session/MediaSession;

    .line 54
    .line 55
    invoke-virtual {v0, v3}, Landroid/media/session/MediaSession;->setActive(Z)V

    .line 56
    .line 57
    .line 58
    new-instance v7, Landroidx/media3/session/z1;

    .line 59
    .line 60
    invoke-virtual {v6}, Landroidx/media3/session/A1;->R()Landroidx/media3/common/PlaybackException;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    invoke-virtual {v6}, Landroidx/media3/session/A1;->M0()Landroidx/media3/session/G1;

    .line 65
    .line 66
    .line 67
    move-result-object v10

    .line 68
    invoke-virtual {v6}, Landroidx/media3/session/A1;->b()LY/A$d;

    .line 69
    .line 70
    .line 71
    move-result-object v11

    .line 72
    invoke-virtual {v6}, Landroidx/media3/session/A1;->b()LY/A$d;

    .line 73
    .line 74
    .line 75
    move-result-object v12

    .line 76
    invoke-virtual {v6}, Landroidx/media3/session/A1;->d()LY/z;

    .line 77
    .line 78
    .line 79
    move-result-object v14

    .line 80
    invoke-virtual {v6}, Landroidx/media3/session/A1;->getRepeatMode()I

    .line 81
    .line 82
    .line 83
    move-result v15

    .line 84
    invoke-virtual {v6}, Landroidx/media3/session/A1;->u0()Z

    .line 85
    .line 86
    .line 87
    move-result v16

    .line 88
    invoke-virtual {v6}, Landroidx/media3/session/A1;->w()LY/O;

    .line 89
    .line 90
    .line 91
    move-result-object v17

    .line 92
    invoke-virtual {v6}, Landroidx/media3/session/A1;->O0()LY/G;

    .line 93
    .line 94
    .line 95
    move-result-object v18

    .line 96
    const/16 v0, 0x12

    .line 97
    .line 98
    invoke-virtual {v6, v0}, Landroidx/media3/session/A1;->I0(I)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_6e

    .line 103
    .line 104
    invoke-virtual {v6}, Landroidx/media3/session/A1;->f0()LY/v;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    :goto_6b
    move-object/from16 v20, v0

    .line 109
    .line 110
    goto :goto_71

    .line 111
    :cond_6e
    sget-object v0, LY/v;->L:LY/v;

    .line 112
    .line 113
    goto :goto_6b

    .line 114
    :goto_71
    const/16 v0, 0x16

    .line 115
    .line 116
    invoke-virtual {v6, v0}, Landroidx/media3/session/A1;->I0(I)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_80

    .line 121
    .line 122
    invoke-virtual {v6}, Landroidx/media3/session/A1;->y()F

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    :goto_7d
    move/from16 v21, v0

    .line 127
    .line 128
    goto :goto_83

    .line 129
    :cond_80
    const/high16 v0, 0x3f800000    # 1.0f

    .line 130
    .line 131
    goto :goto_7d

    .line 132
    :goto_83
    const/16 v0, 0x15

    .line 133
    .line 134
    invoke-virtual {v6, v0}, Landroidx/media3/session/A1;->I0(I)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-eqz v0, :cond_92

    .line 139
    .line 140
    invoke-virtual {v6}, Landroidx/media3/session/A1;->A()LY/c;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    :goto_8f
    move-object/from16 v23, v0

    .line 145
    .line 146
    goto :goto_95

    .line 147
    :cond_92
    sget-object v0, LY/c;->i:LY/c;

    .line 148
    .line 149
    goto :goto_8f

    .line 150
    :goto_95
    const/16 v0, 0x1c

    .line 151
    .line 152
    invoke-virtual {v6, v0}, Landroidx/media3/session/A1;->I0(I)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-eqz v0, :cond_a4

    .line 157
    .line 158
    invoke-virtual {v6}, Landroidx/media3/session/A1;->h0()La0/b;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    :goto_a1
    move-object/from16 v25, v0

    .line 163
    .line 164
    goto :goto_a7

    .line 165
    :cond_a4
    sget-object v0, La0/b;->d:La0/b;

    .line 166
    .line 167
    goto :goto_a1

    .line 168
    :goto_a7
    invoke-virtual {v6}, Landroidx/media3/session/A1;->C()LY/o;

    .line 169
    .line 170
    .line 171
    move-result-object v26

    .line 172
    const/16 v0, 0x17

    .line 173
    .line 174
    invoke-virtual {v6, v0}, Landroidx/media3/session/A1;->I0(I)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-eqz v0, :cond_b7

    .line 179
    .line 180
    invoke-virtual {v6}, Landroidx/media3/session/A1;->g()I

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    :cond_b7
    move/from16 v27, v2

    .line 185
    .line 186
    invoke-virtual {v6}, Landroidx/media3/session/A1;->Q0()Z

    .line 187
    .line 188
    .line 189
    move-result v28

    .line 190
    invoke-virtual {v6}, Landroidx/media3/session/A1;->n()Z

    .line 191
    .line 192
    .line 193
    move-result v29

    .line 194
    invoke-virtual {v6}, Landroidx/media3/session/A1;->n0()I

    .line 195
    .line 196
    .line 197
    move-result v31

    .line 198
    invoke-virtual {v6}, Landroidx/media3/session/A1;->getPlaybackState()I

    .line 199
    .line 200
    .line 201
    move-result v32

    .line 202
    invoke-virtual {v6}, Landroidx/media3/session/A1;->g0()Z

    .line 203
    .line 204
    .line 205
    move-result v33

    .line 206
    invoke-virtual {v6}, Landroidx/media3/session/A1;->f()Z

    .line 207
    .line 208
    .line 209
    move-result v34

    .line 210
    invoke-virtual {v6}, Landroidx/media3/session/A1;->P0()LY/v;

    .line 211
    .line 212
    .line 213
    move-result-object v35

    .line 214
    invoke-virtual {v6}, Landroidx/media3/session/A1;->E0()J

    .line 215
    .line 216
    .line 217
    move-result-wide v36

    .line 218
    invoke-virtual {v6}, Landroidx/media3/session/A1;->V()J

    .line 219
    .line 220
    .line 221
    move-result-wide v38

    .line 222
    invoke-virtual {v6}, Landroidx/media3/session/A1;->s()J

    .line 223
    .line 224
    .line 225
    move-result-wide v40

    .line 226
    const/16 v0, 0x1e

    .line 227
    .line 228
    invoke-virtual {v6, v0}, Landroidx/media3/session/A1;->I0(I)Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-eqz v0, :cond_f0

    .line 233
    .line 234
    invoke-virtual {v6}, Landroidx/media3/session/A1;->d0()LY/K;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    :goto_ed
    move-object/from16 v42, v0

    .line 239
    .line 240
    goto :goto_f3

    .line 241
    :cond_f0
    sget-object v0, LY/K;->b:LY/K;

    .line 242
    .line 243
    goto :goto_ed

    .line 244
    :goto_f3
    invoke-virtual {v6}, Landroidx/media3/session/A1;->v0()LY/J;

    .line 245
    .line 246
    .line 247
    move-result-object v43

    .line 248
    const/16 v24, 0x0

    .line 249
    .line 250
    const/16 v30, 0x1

    .line 251
    .line 252
    const/4 v9, 0x0

    .line 253
    const/4 v13, 0x0

    .line 254
    const/16 v19, 0x0

    .line 255
    .line 256
    const/high16 v22, 0x3f800000    # 1.0f

    .line 257
    .line 258
    invoke-direct/range {v7 .. v43}, Landroidx/media3/session/z1;-><init>(Landroidx/media3/common/PlaybackException;ILandroidx/media3/session/G1;LY/A$d;LY/A$d;ILY/z;IZLY/O;LY/G;ILY/v;FFLY/c;ILa0/b;LY/o;IZZIIIZZLY/v;JJJLY/K;LY/J;)V

    .line 259
    .line 260
    .line 261
    iput-object v7, v4, Landroidx/media3/session/J0;->s:Landroidx/media3/session/z1;

    .line 262
    .line 263
    invoke-virtual {v6}, Landroidx/media3/session/A1;->l()LY/A$a;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-virtual {v4, v0}, Landroidx/media3/session/J0;->h(LY/A$a;)V

    .line 268
    .line 269
    .line 270
    return-void

    .line 271
    :pswitch_10e
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 272
    .line 273
    check-cast v0, Lcom/google/common/util/concurrent/r;

    .line 274
    .line 275
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 276
    .line 277
    check-cast v2, Landroidx/media3/session/legacy/e;

    .line 278
    .line 279
    :try_start_116
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    check-cast v0, Landroidx/media3/session/H1;

    .line 284
    .line 285
    const-string v3, "SessionResult must not be null"

    .line 286
    .line 287
    invoke-static {v0, v3}, Lcom/google/common/base/f;->j(Ljava/lang/Object;Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    iget-object v0, v0, Landroidx/media3/session/H1;->b:Landroid/os/Bundle;

    .line 291
    .line 292
    invoke-virtual {v2, v0}, Landroidx/media3/session/legacy/f$g;->f(Ljava/lang/Object;)V
    :try_end_126
    .catch Ljava/util/concurrent/CancellationException; {:try_start_116 .. :try_end_126} :catch_12b
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_116 .. :try_end_126} :catch_129
    .catch Ljava/lang/InterruptedException; {:try_start_116 .. :try_end_126} :catch_127

    .line 293
    .line 294
    .line 295
    goto :goto_136

    .line 296
    :catch_127
    move-exception v0

    .line 297
    goto :goto_12c

    .line 298
    :catch_129
    move-exception v0

    .line 299
    goto :goto_12c

    .line 300
    :catch_12b
    move-exception v0

    .line 301
    :goto_12c
    const-string v3, "MLSLegacyStub"

    .line 302
    .line 303
    const-string v4, "Custom action failed"

    .line 304
    .line 305
    invoke-static {v3, v4, v0}, Lb0/o;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 306
    .line 307
    .line 308
    invoke-virtual {v2}, Landroidx/media3/session/legacy/f$g;->e()V

    .line 309
    .line 310
    .line 311
    :goto_136
    return-void

    .line 312
    :pswitch_137
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 313
    .line 314
    check-cast v0, Landroidx/media3/exoplayer/c0$a;

    .line 315
    .line 316
    iget-object v0, v0, Landroidx/media3/exoplayer/c0$a;->b:Landroidx/media3/exoplayer/c0;

    .line 317
    .line 318
    iget-object v0, v0, Landroidx/media3/exoplayer/c0;->h:Lg0/a;

    .line 319
    .line 320
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 321
    .line 322
    check-cast v2, Landroid/util/Pair;

    .line 323
    .line 324
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 325
    .line 326
    check-cast v3, Ljava/lang/Integer;

    .line 327
    .line 328
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 329
    .line 330
    .line 331
    move-result v3

    .line 332
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 333
    .line 334
    check-cast v2, Landroidx/media3/exoplayer/source/h$b;

    .line 335
    .line 336
    invoke-interface {v0, v3, v2}, Landroidx/media3/exoplayer/drm/a;->f0(ILandroidx/media3/exoplayer/source/h$b;)V

    .line 337
    .line 338
    .line 339
    return-void

    .line 340
    :pswitch_153
    const-string v0, "audio"

    .line 341
    .line 342
    iget-object v2, v1, LAb/O;->b:Ljava/lang/Object;

    .line 343
    .line 344
    check-cast v2, Landroid/content/Context;

    .line 345
    .line 346
    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    check-cast v0, Landroid/media/AudioManager;

    .line 351
    .line 352
    sput-object v0, LZ/f;->a:Landroid/media/AudioManager;

    .line 353
    .line 354
    iget-object v0, v1, LAb/O;->c:Ljava/lang/Object;

    .line 355
    .line 356
    check-cast v0, Lb0/j;

    .line 357
    .line 358
    invoke-virtual {v0}, Lb0/j;->d()Z

    .line 359
    .line 360
    .line 361
    return-void

    .line 362
    :pswitch_169
    iget-object v0, v1, LAb/O;->c:Ljava/lang/Object;

    .line 363
    .line 364
    check-cast v0, Lcom/oplus/melody/model/repository/earphone/EarphoneDTO;

    .line 365
    .line 366
    iget-object v2, v1, LAb/O;->b:Ljava/lang/Object;

    .line 367
    .line 368
    check-cast v2, Lcom/oplus/melody/ui/component/detail/multiconnection/MultiDevicesManagerItem;

    .line 369
    .line 370
    invoke-static {v2, v0}, Lcom/oplus/melody/ui/component/detail/multiconnection/MultiDevicesManagerItem;->D(Lcom/oplus/melody/ui/component/detail/multiconnection/MultiDevicesManagerItem;Lcom/oplus/melody/model/repository/earphone/EarphoneDTO;)V

    .line 371
    .line 372
    .line 373
    return-void

    .line 374
    :pswitch_175
    sget v0, Lcom/oplus/melody/heytranslation/language/LanguageChooseView;->r:I

    .line 375
    .line 376
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 377
    .line 378
    check-cast v0, Lcom/oplus/melody/heytranslation/language/LanguageChooseView;

    .line 379
    .line 380
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 381
    .line 382
    check-cast v2, Landroid/widget/TextView;

    .line 383
    .line 384
    invoke-virtual {v0, v2}, Lcom/oplus/melody/heytranslation/language/LanguageChooseView;->c(Landroid/widget/TextView;)V

    .line 385
    .line 386
    .line 387
    return-void

    .line 388
    :pswitch_183
    iget-object v4, v1, LAb/O;->b:Ljava/lang/Object;

    .line 389
    .line 390
    check-cast v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 391
    .line 392
    invoke-virtual {v4, v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 393
    .line 394
    .line 395
    move-result v2

    .line 396
    if-eqz v2, :cond_19b

    .line 397
    .line 398
    const-string v2, "ChannelCrypto_websocket"

    .line 399
    .line 400
    const-string v3, "prepareHeaders, wait account credentials timeout"

    .line 401
    .line 402
    invoke-static {v2, v3}, Lcom/oplus/melody/common/util/y;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    .line 404
    .line 405
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 406
    .line 407
    check-cast v2, LMa/k;

    .line 408
    .line 409
    invoke-virtual {v2, v0}, LMa/k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    :cond_19b
    return-void

    .line 413
    :pswitch_19c
    iget-object v3, v1, LAb/O;->b:Ljava/lang/Object;

    .line 414
    .line 415
    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    .line 416
    .line 417
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 418
    .line 419
    .line 420
    move-result v4

    .line 421
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 422
    .line 423
    .line 424
    move-result-object v5

    .line 425
    if-lez v4, :cond_1ab

    .line 426
    .line 427
    move-object v0, v5

    .line 428
    :cond_1ab
    iget-object v4, v1, LAb/O;->c:Ljava/lang/Object;

    .line 429
    .line 430
    check-cast v4, Landroid/view/View;

    .line 431
    .line 432
    if-eqz v0, :cond_1b6

    .line 433
    .line 434
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 435
    .line 436
    .line 437
    move-result v0

    .line 438
    goto :goto_1ba

    .line 439
    :cond_1b6
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 440
    .line 441
    .line 442
    move-result v0

    .line 443
    :goto_1ba
    if-gtz v0, :cond_1bd

    .line 444
    .line 445
    goto :goto_1e4

    .line 446
    :cond_1bd
    const/high16 v5, 0x40000000    # 2.0f

    .line 447
    .line 448
    invoke-static {v0, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 449
    .line 450
    .line 451
    move-result v0

    .line 452
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 453
    .line 454
    .line 455
    move-result v2

    .line 456
    invoke-virtual {v3, v0, v2}, Landroid/view/View;->measure(II)V

    .line 457
    .line 458
    .line 459
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 460
    .line 461
    .line 462
    move-result v0

    .line 463
    if-lez v0, :cond_1e4

    .line 464
    .line 465
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 466
    .line 467
    .line 468
    move-result-object v2

    .line 469
    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 470
    .line 471
    if-eq v2, v0, :cond_1e4

    .line 472
    .line 473
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 474
    .line 475
    .line 476
    move-result-object v2

    .line 477
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 478
    .line 479
    invoke-virtual {v4, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 480
    .line 481
    .line 482
    invoke-virtual {v4}, Landroid/view/View;->requestLayout()V

    .line 483
    .line 484
    .line 485
    :cond_1e4
    :goto_1e4
    return-void

    .line 486
    :pswitch_1e5
    const-string v0, "$back"

    .line 487
    .line 488
    iget-object v2, v1, LAb/O;->b:Ljava/lang/Object;

    .line 489
    .line 490
    check-cast v2, LTe/l;

    .line 491
    .line 492
    invoke-static {v2, v0}, Lkotlin/jvm/internal/i;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 493
    .line 494
    .line 495
    iget-object v0, v1, LAb/O;->c:Ljava/lang/Object;

    .line 496
    .line 497
    invoke-interface {v2, v0}, LTe/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 498
    .line 499
    .line 500
    return-void

    .line 501
    :pswitch_1f4
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 502
    .line 503
    check-cast v0, Landroidx/fragment/app/Fragment;

    .line 504
    .line 505
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 506
    .line 507
    .line 508
    move-result v0

    .line 509
    if-nez v0, :cond_1ff

    .line 510
    .line 511
    goto :goto_223

    .line 512
    :cond_1ff
    invoke-static {}, LSb/d;->b()Z

    .line 513
    .line 514
    .line 515
    move-result v0

    .line 516
    if-eqz v0, :cond_223

    .line 517
    .line 518
    iget-object v0, v1, LAb/O;->c:Ljava/lang/Object;

    .line 519
    .line 520
    check-cast v0, Ljava/lang/String;

    .line 521
    .line 522
    invoke-static {v0}, Lcom/oplus/melody/common/util/y;->r(Ljava/lang/String;)Ljava/lang/String;

    .line 523
    .line 524
    .line 525
    move-result-object v0

    .line 526
    new-instance v2, Ljava/lang/StringBuilder;

    .line 527
    .line 528
    const-string v3, "checkAndShowInitLoadingDialog time out to dismiss, addr: "

    .line 529
    .line 530
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 531
    .line 532
    .line 533
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    .line 535
    .line 536
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 537
    .line 538
    .line 539
    move-result-object v0

    .line 540
    const-string v2, "m_bt_le.LeAudioDialogHelper"

    .line 541
    .line 542
    invoke-static {v2, v0}, Lcom/oplus/melody/common/util/y;->y(Ljava/lang/String;Ljava/lang/String;)V

    .line 543
    .line 544
    .line 545
    invoke-static {}, LSb/d;->a()V

    .line 546
    .line 547
    .line 548
    :cond_223
    :goto_223
    return-void

    .line 549
    :pswitch_224
    iget-object v4, v1, LAb/O;->c:Ljava/lang/Object;

    .line 550
    .line 551
    check-cast v4, LPb/c;

    .line 552
    .line 553
    invoke-virtual {v4}, LPb/c;->getCodecList()Ljava/util/List;

    .line 554
    .line 555
    .line 556
    move-result-object v4

    .line 557
    iget-object v5, v1, LAb/O;->b:Ljava/lang/Object;

    .line 558
    .line 559
    check-cast v5, Lcom/oplus/melody/ui/component/detail/highaudio/HighAudioPreferenceFragment;

    .line 560
    .line 561
    iget-object v6, v5, Lcom/oplus/melody/ui/component/detail/highaudio/HighAudioPreferenceFragment;->C:Landroidx/preference/PreferenceCategory;

    .line 562
    .line 563
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/f;

    .line 564
    .line 565
    .line 566
    move-result-object v7

    .line 567
    if-eqz v7, :cond_23a

    .line 568
    .line 569
    if-nez v6, :cond_23e

    .line 570
    .line 571
    :cond_23a
    move/from16 v16, v3

    .line 572
    .line 573
    goto/16 :goto_313

    .line 574
    .line 575
    :cond_23e
    move-object v8, v4

    .line 576
    check-cast v8, Ljava/util/Collection;

    .line 577
    .line 578
    invoke-interface {v8}, Ljava/util/Collection;->size()I

    .line 579
    .line 580
    .line 581
    move-result v8

    .line 582
    move v9, v2

    .line 583
    :goto_246
    iget-object v10, v6, Landroidx/preference/PreferenceGroup;->c:Ljava/util/ArrayList;

    .line 584
    .line 585
    const-string v11, "getPreference(...)"

    .line 586
    .line 587
    if-ge v9, v8, :cond_2be

    .line 588
    .line 589
    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 590
    .line 591
    .line 592
    move-result-object v12

    .line 593
    check-cast v12, LPb/a;

    .line 594
    .line 595
    iget v12, v12, LPb/a;->a:I

    .line 596
    .line 597
    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object v12

    .line 601
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 602
    .line 603
    .line 604
    move-result v10

    .line 605
    move-object v14, v0

    .line 606
    move v13, v2

    .line 607
    :goto_25e
    if-ge v13, v10, :cond_27e

    .line 608
    .line 609
    invoke-virtual {v6, v13}, Landroidx/preference/PreferenceGroup;->h(I)Landroidx/preference/Preference;

    .line 610
    .line 611
    .line 612
    move-result-object v15

    .line 613
    invoke-static {v15, v11}, Lkotlin/jvm/internal/i;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 614
    .line 615
    .line 616
    move/from16 v16, v3

    .line 617
    .line 618
    invoke-virtual {v15}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    .line 619
    .line 620
    .line 621
    move-result-object v3

    .line 622
    invoke-static {v12, v3}, Lkotlin/jvm/internal/i;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 623
    .line 624
    .line 625
    move-result v3

    .line 626
    if-eqz v3, :cond_279

    .line 627
    .line 628
    invoke-virtual {v15, v9}, Landroidx/preference/Preference;->setOrder(I)V

    .line 629
    .line 630
    .line 631
    move-object v14, v15

    .line 632
    check-cast v14, Lcom/oplus/melody/ui/widget/MelodyRadioPreference;

    .line 633
    .line 634
    :cond_279
    add-int/lit8 v13, v13, 0x1

    .line 635
    .line 636
    move/from16 v3, v16

    .line 637
    .line 638
    goto :goto_25e

    .line 639
    :cond_27e
    move/from16 v16, v3

    .line 640
    .line 641
    if-nez v14, :cond_2b9

    .line 642
    .line 643
    new-instance v3, Lcom/oplus/melody/ui/widget/MelodyRadioPreference;

    .line 644
    .line 645
    invoke-direct {v3, v7, v0}, Lcom/oplus/melody/ui/widget/MelodyRadioPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 646
    .line 647
    .line 648
    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 649
    .line 650
    .line 651
    move-result-object v10

    .line 652
    check-cast v10, LPb/a;

    .line 653
    .line 654
    iget-object v10, v10, LPb/a;->b:Ljava/lang/String;

    .line 655
    .line 656
    invoke-virtual {v3, v10}, Lcom/oplus/melody/ui/widget/MelodyRadioPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 657
    .line 658
    .line 659
    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 660
    .line 661
    .line 662
    move-result-object v10

    .line 663
    check-cast v10, LPb/a;

    .line 664
    .line 665
    iget-object v10, v10, LPb/a;->c:Ljava/lang/String;

    .line 666
    .line 667
    invoke-virtual {v3, v10}, Landroidx/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 668
    .line 669
    .line 670
    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 671
    .line 672
    .line 673
    move-result-object v10

    .line 674
    check-cast v10, LPb/a;

    .line 675
    .line 676
    iget-boolean v10, v10, LPb/a;->e:Z

    .line 677
    .line 678
    invoke-virtual {v3, v10}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 679
    .line 680
    .line 681
    invoke-virtual {v3, v12}, Landroidx/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 682
    .line 683
    .line 684
    invoke-virtual {v3, v9}, Landroidx/preference/Preference;->setOrder(I)V

    .line 685
    .line 686
    .line 687
    invoke-virtual {v3, v2}, Landroidx/preference/Preference;->setPersistent(Z)V

    .line 688
    .line 689
    .line 690
    iget-object v10, v5, Lcom/oplus/melody/ui/component/detail/highaudio/HighAudioPreferenceFragment;->H:LAb/s0;

    .line 691
    .line 692
    invoke-virtual {v3, v10}, Landroidx/preference/Preference;->setOnPreferenceChangeListener(Landroidx/preference/Preference$c;)V

    .line 693
    .line 694
    .line 695
    invoke-virtual {v6, v3}, Landroidx/preference/PreferenceGroup;->e(Landroidx/preference/Preference;)V

    .line 696
    .line 697
    .line 698
    :cond_2b9
    add-int/lit8 v9, v9, 0x1

    .line 699
    .line 700
    move/from16 v3, v16

    .line 701
    .line 702
    goto :goto_246

    .line 703
    :cond_2be
    move/from16 v16, v3

    .line 704
    .line 705
    new-instance v3, Ljava/util/ArrayList;

    .line 706
    .line 707
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 708
    .line 709
    .line 710
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 711
    .line 712
    .line 713
    move-result v5

    .line 714
    move v7, v2

    .line 715
    :goto_2ca
    if-ge v7, v5, :cond_301

    .line 716
    .line 717
    invoke-virtual {v6, v7}, Landroidx/preference/PreferenceGroup;->h(I)Landroidx/preference/Preference;

    .line 718
    .line 719
    .line 720
    move-result-object v8

    .line 721
    invoke-static {v8, v11}, Lkotlin/jvm/internal/i;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 722
    .line 723
    .line 724
    move-object v9, v4

    .line 725
    check-cast v9, Ljava/lang/Iterable;

    .line 726
    .line 727
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 728
    .line 729
    .line 730
    move-result-object v9

    .line 731
    :cond_2da
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 732
    .line 733
    .line 734
    move-result v10

    .line 735
    if-eqz v10, :cond_2f8

    .line 736
    .line 737
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 738
    .line 739
    .line 740
    move-result-object v10

    .line 741
    move-object v12, v10

    .line 742
    check-cast v12, LPb/a;

    .line 743
    .line 744
    iget v12, v12, LPb/a;->a:I

    .line 745
    .line 746
    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 747
    .line 748
    .line 749
    move-result-object v12

    .line 750
    invoke-virtual {v8}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    .line 751
    .line 752
    .line 753
    move-result-object v13

    .line 754
    invoke-static {v12, v13}, Lkotlin/jvm/internal/i;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 755
    .line 756
    .line 757
    move-result v12

    .line 758
    if-eqz v12, :cond_2da

    .line 759
    .line 760
    goto :goto_2f9

    .line 761
    :cond_2f8
    move-object v10, v0

    .line 762
    :goto_2f9
    if-nez v10, :cond_2fe

    .line 763
    .line 764
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 765
    .line 766
    .line 767
    :cond_2fe
    add-int/lit8 v7, v7, 0x1

    .line 768
    .line 769
    goto :goto_2ca

    .line 770
    :cond_301
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 771
    .line 772
    .line 773
    move-result v0

    .line 774
    :goto_305
    if-ge v2, v0, :cond_32a

    .line 775
    .line 776
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 777
    .line 778
    .line 779
    move-result-object v4

    .line 780
    add-int/lit8 v2, v2, 0x1

    .line 781
    .line 782
    check-cast v4, Landroidx/preference/Preference;

    .line 783
    .line 784
    invoke-virtual {v6, v4}, Landroidx/preference/PreferenceGroup;->j(Landroidx/preference/Preference;)Z

    .line 785
    .line 786
    .line 787
    goto :goto_305

    .line 788
    :goto_313
    if-nez v7, :cond_317

    .line 789
    .line 790
    move/from16 v2, v16

    .line 791
    .line 792
    :cond_317
    new-instance v0, Ljava/lang/StringBuilder;

    .line 793
    .line 794
    const-string v3, "refreshCodecList act==null:"

    .line 795
    .line 796
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 797
    .line 798
    .line 799
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 800
    .line 801
    .line 802
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 803
    .line 804
    .line 805
    move-result-object v0

    .line 806
    const-string v2, "HighAudioPreferenceFragment"

    .line 807
    .line 808
    invoke-static {v2, v0}, Lcom/oplus/melody/common/util/y;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 809
    .line 810
    .line 811
    :cond_32a
    return-void

    .line 812
    :pswitch_32b
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 813
    .line 814
    check-cast v0, Ljava/io/File;

    .line 815
    .line 816
    invoke-static {v0}, LN4/j;->c(Ljava/io/File;)Ljava/lang/String;

    .line 817
    .line 818
    .line 819
    move-result-object v2

    .line 820
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 821
    .line 822
    .line 823
    move-result-object v0

    .line 824
    new-instance v3, Ljava/lang/StringBuilder;

    .line 825
    .line 826
    const-string v4, "check md5 before install, fileMd5="

    .line 827
    .line 828
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 829
    .line 830
    .line 831
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 832
    .line 833
    .line 834
    const-string v4, ",expectMd5="

    .line 835
    .line 836
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 837
    .line 838
    .line 839
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 840
    .line 841
    .line 842
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 843
    .line 844
    .line 845
    move-result-object v3

    .line 846
    const-string v4, "upgrade_Utilities"

    .line 847
    .line 848
    invoke-static {v4, v3}, LN4/g;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 849
    .line 850
    .line 851
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 852
    .line 853
    .line 854
    move-result v0

    .line 855
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 856
    .line 857
    check-cast v2, LH4/b;

    .line 858
    .line 859
    if-eqz v0, :cond_360

    .line 860
    .line 861
    invoke-interface {v2}, LH4/b;->b()V

    .line 862
    .line 863
    .line 864
    goto :goto_363

    .line 865
    :cond_360
    invoke-interface {v2}, LH4/b;->d()V

    .line 866
    .line 867
    .line 868
    :goto_363
    return-void

    .line 869
    :pswitch_364
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 870
    .line 871
    check-cast v0, LMc/r;

    .line 872
    .line 873
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 874
    .line 875
    .line 876
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 877
    .line 878
    check-cast v2, Ljava/lang/String;

    .line 879
    .line 880
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 881
    .line 882
    .line 883
    move-result v3

    .line 884
    if-eqz v3, :cond_376

    .line 885
    .line 886
    goto :goto_388

    .line 887
    :cond_376
    iget-object v0, v0, LMc/r;->I:Lcom/coui/appcompat/preference/COUIPreferenceCategory;

    .line 888
    .line 889
    if-eqz v0, :cond_388

    .line 890
    .line 891
    invoke-virtual {v0, v2}, Landroidx/preference/PreferenceGroup;->g(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 892
    .line 893
    .line 894
    move-result-object v0

    .line 895
    if-nez v0, :cond_381

    .line 896
    .line 897
    goto :goto_388

    .line 898
    :cond_381
    invoke-virtual {v0}, Landroidx/preference/Preference;->getParent()Landroidx/preference/PreferenceGroup;

    .line 899
    .line 900
    .line 901
    move-result-object v2

    .line 902
    invoke-virtual {v2, v0}, Landroidx/preference/PreferenceGroup;->j(Landroidx/preference/Preference;)Z

    .line 903
    .line 904
    .line 905
    :cond_388
    :goto_388
    return-void

    .line 906
    :pswitch_389
    move/from16 v16, v3

    .line 907
    .line 908
    iget-object v3, v1, LAb/O;->b:Ljava/lang/Object;

    .line 909
    .line 910
    check-cast v3, LM4/a;

    .line 911
    .line 912
    iget-object v3, v3, LM4/a;->f:LH4/f;

    .line 913
    .line 914
    iget-object v4, v1, LAb/O;->c:Ljava/lang/Object;

    .line 915
    .line 916
    check-cast v4, Lcom/heytap/upgrade/model/UpgradeInfo;

    .line 917
    .line 918
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 919
    .line 920
    .line 921
    new-instance v5, Ljava/lang/StringBuilder;

    .line 922
    .line 923
    const-string v6, "onResult, upgradeInfo="

    .line 924
    .line 925
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 926
    .line 927
    .line 928
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 929
    .line 930
    .line 931
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 932
    .line 933
    .line 934
    move-result-object v5

    .line 935
    const-string v6, "UpgradeSDK"

    .line 936
    .line 937
    invoke-static {v6, v5}, LN4/g;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 938
    .line 939
    .line 940
    iget-boolean v5, v4, Lcom/heytap/upgrade/model/UpgradeInfo;->bundle:Z

    .line 941
    .line 942
    iget-object v6, v3, LH4/f;->p:Ljava/lang/Object;

    .line 943
    .line 944
    check-cast v6, Lcom/heytap/upgrade/UpgradeSDK;

    .line 945
    .line 946
    if-eqz v5, :cond_3bb

    .line 947
    .line 948
    new-instance v5, LI4/c;

    .line 949
    .line 950
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 951
    .line 952
    .line 953
    iput-object v5, v6, Lcom/heytap/upgrade/UpgradeSDK;->inner:LI4/a;

    .line 954
    .line 955
    goto :goto_3c2

    .line 956
    :cond_3bb
    new-instance v5, LI4/e;

    .line 957
    .line 958
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 959
    .line 960
    .line 961
    iput-object v5, v6, Lcom/heytap/upgrade/UpgradeSDK;->inner:LI4/a;

    .line 962
    .line 963
    :goto_3c2
    iget-object v5, v6, Lcom/heytap/upgrade/UpgradeSDK;->inner:LI4/a;

    .line 964
    .line 965
    sget-object v7, LN4/j;->e:Landroid/content/Context;

    .line 966
    .line 967
    invoke-static {v6}, Lcom/heytap/upgrade/UpgradeSDK;->a(Lcom/heytap/upgrade/UpgradeSDK;)LH4/d;

    .line 968
    .line 969
    .line 970
    move-result-object v8

    .line 971
    invoke-virtual {v5, v7, v8}, LI4/a;->a(Landroid/content/Context;LH4/d;)V

    .line 972
    .line 973
    .line 974
    invoke-static {v6}, Lcom/heytap/upgrade/UpgradeSDK;->c(Lcom/heytap/upgrade/UpgradeSDK;)Ljava/util/HashMap;

    .line 975
    .line 976
    .line 977
    move-result-object v5

    .line 978
    iget-object v6, v3, LH4/f;->c:Ljava/lang/Object;

    .line 979
    .line 980
    check-cast v6, LH4/a;

    .line 981
    .line 982
    iget-object v6, v6, LH4/a;->a:Ljava/lang/String;

    .line 983
    .line 984
    invoke-virtual {v5, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 985
    .line 986
    .line 987
    iget-object v3, v3, LH4/f;->b:Ljava/lang/Object;

    .line 988
    .line 989
    check-cast v3, Lo4/c$a;

    .line 990
    .line 991
    if-eqz v3, :cond_488

    .line 992
    .line 993
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 994
    .line 995
    .line 996
    invoke-static {}, Lcom/oplus/melody/common/util/y;->l()Z

    .line 997
    .line 998
    .line 999
    move-result v3

    .line 1000
    const-string v5, "AppUpgradeRepository"

    .line 1001
    .line 1002
    if-eqz v3, :cond_3fc

    .line 1003
    .line 1004
    new-instance v3, Ljava/lang/StringBuilder;

    .line 1005
    .line 1006
    const-string v6, "onResult upgradeInfo = "

    .line 1007
    .line 1008
    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1009
    .line 1010
    .line 1011
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1012
    .line 1013
    .line 1014
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1015
    .line 1016
    .line 1017
    move-result-object v3

    .line 1018
    invoke-static {v5, v3}, Lcom/oplus/melody/common/util/y;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1019
    .line 1020
    .line 1021
    :cond_3fc
    sput-object v4, Lo4/c;->q:Lcom/heytap/upgrade/model/UpgradeInfo;

    .line 1022
    .line 1023
    iget-object v3, v4, Lcom/heytap/upgrade/model/UpgradeInfo;->versionName:Ljava/lang/String;

    .line 1024
    .line 1025
    if-eqz v3, :cond_40a

    .line 1026
    .line 1027
    iget v3, v4, Lcom/heytap/upgrade/model/UpgradeInfo;->upgradeFlag:I

    .line 1028
    .line 1029
    move/from16 v6, v16

    .line 1030
    .line 1031
    if-eq v3, v6, :cond_40a

    .line 1032
    .line 1033
    const/4 v8, 0x1

    .line 1034
    goto :goto_40b

    .line 1035
    :cond_40a
    move v8, v2

    .line 1036
    :goto_40b
    sget-object v2, Lo4/c;->c:Lo4/c;

    .line 1037
    .line 1038
    invoke-static {v2}, Lo4/c;->a(Lo4/c;)Lo4/a;

    .line 1039
    .line 1040
    .line 1041
    move-result-object v7

    .line 1042
    iget-object v9, v4, Lcom/heytap/upgrade/model/UpgradeInfo;->versionName:Ljava/lang/String;

    .line 1043
    .line 1044
    const-string v3, "versionName"

    .line 1045
    .line 1046
    invoke-static {v9, v3}, Lkotlin/jvm/internal/i;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1047
    .line 1048
    .line 1049
    const/4 v11, 0x0

    .line 1050
    const/4 v12, 0x0

    .line 1051
    const/4 v10, 0x0

    .line 1052
    const/16 v13, 0x1c

    .line 1053
    .line 1054
    const/4 v14, 0x0

    .line 1055
    invoke-static/range {v7 .. v14}, Lo4/a;->copy$default(Lo4/a;ZLjava/lang/String;IIIILjava/lang/Object;)Lo4/a;

    .line 1056
    .line 1057
    .line 1058
    move-result-object v6

    .line 1059
    sget-object v7, Lo4/c;->p:Lha/k;

    .line 1060
    .line 1061
    invoke-virtual {v7, v6}, Lha/k;->m(Ljava/lang/Object;)Z

    .line 1062
    .line 1063
    .line 1064
    if-eqz v8, :cond_488

    .line 1065
    .line 1066
    invoke-virtual {v6}, Lo4/a;->getDownloadState()I

    .line 1067
    .line 1068
    .line 1069
    move-result v6

    .line 1070
    const/4 v7, 0x2

    .line 1071
    if-eq v6, v7, :cond_488

    .line 1072
    .line 1073
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1074
    .line 1075
    .line 1076
    sget-boolean v2, LU8/b;->l:Z

    .line 1077
    .line 1078
    if-eqz v2, :cond_438

    .line 1079
    .line 1080
    goto :goto_488

    .line 1081
    :cond_438
    sget-boolean v2, Lo4/c;->s:Z

    .line 1082
    .line 1083
    new-instance v6, Ljava/lang/StringBuilder;

    .line 1084
    .line 1085
    const-string v7, "startFindAppUpgradeActivity "

    .line 1086
    .line 1087
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1088
    .line 1089
    .line 1090
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 1091
    .line 1092
    .line 1093
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1094
    .line 1095
    .line 1096
    move-result-object v2

    .line 1097
    invoke-static {v5, v2}, Lcom/oplus/melody/common/util/y;->y(Ljava/lang/String;Ljava/lang/String;)V

    .line 1098
    .line 1099
    .line 1100
    sget-boolean v2, Lo4/c;->s:Z

    .line 1101
    .line 1102
    if-nez v2, :cond_450

    .line 1103
    .line 1104
    goto :goto_488

    .line 1105
    :cond_450
    invoke-static {}, LWa/a;->u()LWa/a;

    .line 1106
    .line 1107
    .line 1108
    move-result-object v2

    .line 1109
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1110
    .line 1111
    .line 1112
    sget-object v2, LXa/h;->h:LGe/b;

    .line 1113
    .line 1114
    const-string v2, "/heymelody_app/app_upgrade"

    .line 1115
    .line 1116
    invoke-static {v2}, LXa/h$a;->a(Ljava/lang/String;)LXa/h;

    .line 1117
    .line 1118
    .line 1119
    move-result-object v2

    .line 1120
    iget-object v5, v4, Lcom/heytap/upgrade/model/UpgradeInfo;->versionName:Ljava/lang/String;

    .line 1121
    .line 1122
    invoke-virtual {v2, v3, v5}, LXa/h;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1123
    .line 1124
    .line 1125
    iget-wide v5, v4, Lcom/heytap/upgrade/model/UpgradeInfo;->apkSize:J

    .line 1126
    .line 1127
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 1128
    .line 1129
    .line 1130
    move-result-object v3

    .line 1131
    const-string v5, "apkFileSize"

    .line 1132
    .line 1133
    invoke-virtual {v2, v5, v3}, LXa/h;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1134
    .line 1135
    .line 1136
    const-string v3, "upgradeComment"

    .line 1137
    .line 1138
    iget-object v4, v4, Lcom/heytap/upgrade/model/UpgradeInfo;->upgradeComment:Ljava/lang/String;

    .line 1139
    .line 1140
    invoke-virtual {v2, v3, v4}, LXa/h;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1141
    .line 1142
    .line 1143
    const/4 v6, 0x1

    .line 1144
    invoke-virtual {v2, v6}, LXa/h;->a(I)V

    .line 1145
    .line 1146
    .line 1147
    sget-object v3, Lcom/oplus/melody/common/util/k;->a:Lcom/heytap/headset/HeyMelodyApplication;

    .line 1148
    .line 1149
    if-eqz v3, :cond_482

    .line 1150
    .line 1151
    invoke-virtual {v2, v3}, LXa/h;->b(Landroid/content/Context;)V

    .line 1152
    .line 1153
    .line 1154
    goto :goto_488

    .line 1155
    :cond_482
    const-string v2, "context"

    .line 1156
    .line 1157
    invoke-static {v2}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 1158
    .line 1159
    .line 1160
    throw v0

    .line 1161
    :cond_488
    :goto_488
    return-void

    .line 1162
    :pswitch_489
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1163
    .line 1164
    check-cast v0, Lcom/oplus/melody/ui/component/multidevicesconnnect/AutoSwitchLinkSwitchPreference;

    .line 1165
    .line 1166
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1167
    .line 1168
    check-cast v2, LLc/b;

    .line 1169
    .line 1170
    invoke-static {v0, v2}, Lcom/oplus/melody/ui/component/multidevicesconnnect/AutoSwitchLinkSwitchPreference;->r(Lcom/oplus/melody/ui/component/multidevicesconnnect/AutoSwitchLinkSwitchPreference;LLc/b;)V

    .line 1171
    .line 1172
    .line 1173
    return-void

    .line 1174
    :pswitch_495
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1175
    .line 1176
    check-cast v0, Lcom/oplus/melody/ui/component/detail/headmotion/HeadMotionFragment;

    .line 1177
    .line 1178
    iget-object v2, v0, Lcom/oplus/melody/ui/component/detail/headmotion/HeadMotionFragment;->K:Ljava/lang/Integer;

    .line 1179
    .line 1180
    if-eqz v2, :cond_4a4

    .line 1181
    .line 1182
    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    .line 1183
    .line 1184
    .line 1185
    move-result v2

    .line 1186
    invoke-virtual {v0, v2}, Lcom/oplus/melody/ui/component/detail/headmotion/HeadMotionFragment;->v(I)V

    .line 1187
    .line 1188
    .line 1189
    :cond_4a4
    iget-object v0, v0, Lcom/oplus/melody/ui/component/detail/headmotion/HeadMotionFragment;->H:Lcom/oplus/melody/ui/component/detail/headmotion/HeadMotionViewModel;

    .line 1190
    .line 1191
    if-eqz v0, :cond_4b8

    .line 1192
    .line 1193
    const-string v0, "macAddress"

    .line 1194
    .line 1195
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1196
    .line 1197
    check-cast v2, Ljava/lang/String;

    .line 1198
    .line 1199
    invoke-static {v2, v0}, Lkotlin/jvm/internal/i;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1200
    .line 1201
    .line 1202
    invoke-static {}, Lcom/oplus/melody/model/repository/earphone/b;->G()Lcom/oplus/melody/model/repository/earphone/b;

    .line 1203
    .line 1204
    .line 1205
    move-result-object v0

    .line 1206
    invoke-virtual {v0, v2}, Lcom/oplus/melody/model/repository/earphone/b;->E(Ljava/lang/String;)V

    .line 1207
    .line 1208
    .line 1209
    :cond_4b8
    return-void

    .line 1210
    :pswitch_4b9
    iget-object v2, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1211
    .line 1212
    check-cast v2, LKc/d;

    .line 1213
    .line 1214
    iget-object v2, v2, LKc/d;->b:Lcom/oplus/melody/ui/component/hearingenhance/widget/VoiceWaveView;

    .line 1215
    .line 1216
    iget-object v3, v2, Lcom/oplus/melody/ui/component/hearingenhance/widget/VoiceWaveView;->q:Landroid/animation/ValueAnimator;

    .line 1217
    .line 1218
    if-eqz v3, :cond_4cb

    .line 1219
    .line 1220
    invoke-virtual {v3}, Landroid/animation/Animator;->removeAllListeners()V

    .line 1221
    .line 1222
    .line 1223
    iget-object v2, v2, Lcom/oplus/melody/ui/component/hearingenhance/widget/VoiceWaveView;->q:Landroid/animation/ValueAnimator;

    .line 1224
    .line 1225
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->cancel()V

    .line 1226
    .line 1227
    .line 1228
    :cond_4cb
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1229
    .line 1230
    check-cast v2, LAb/s0;

    .line 1231
    .line 1232
    invoke-virtual {v2, v0}, LAb/s0;->d(Ljava/lang/Object;)V

    .line 1233
    .line 1234
    .line 1235
    return-void

    .line 1236
    :pswitch_4d3
    iget-object v0, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1237
    .line 1238
    check-cast v0, Lcom/oplus/melody/model/repository/earphone/EarphoneDTO;

    .line 1239
    .line 1240
    iget-object v2, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1241
    .line 1242
    check-cast v2, Lcom/oplus/melody/ui/component/detail/gamemode/GameSetItem;

    .line 1243
    .line 1244
    invoke-static {v2, v0}, Lcom/oplus/melody/ui/component/detail/gamemode/GameSetItem;->g(Lcom/oplus/melody/ui/component/detail/gamemode/GameSetItem;Lcom/oplus/melody/model/repository/earphone/EarphoneDTO;)V

    .line 1245
    .line 1246
    .line 1247
    return-void

    .line 1248
    :pswitch_4df
    sget v2, Lcom/oplus/accountsdk/open/core/web/AcOpenWebUrlSyncActivity;->r:I

    .line 1249
    .line 1250
    iget-object v2, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1251
    .line 1252
    check-cast v2, Lcom/oplus/accountsdk/open/core/web/AcOpenWebUrlSyncActivity;

    .line 1253
    .line 1254
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 1255
    .line 1256
    .line 1257
    move-result-object v3

    .line 1258
    iget-object v4, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1259
    .line 1260
    check-cast v4, Ljava/lang/String;

    .line 1261
    .line 1262
    invoke-virtual {v2, v3, v4, v0}, Lcom/oplus/accountsdk/open/core/web/AcOpenWebUrlSyncActivity;->B(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1263
    .line 1264
    .line 1265
    return-void

    .line 1266
    :pswitch_4f1
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1267
    .line 1268
    check-cast v0, LIc/h1;

    .line 1269
    .line 1270
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1271
    .line 1272
    check-cast v2, LIc/E;

    .line 1273
    .line 1274
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1275
    .line 1276
    .line 1277
    new-instance v3, LA9/d;

    .line 1278
    .line 1279
    const/16 v4, 0xe

    .line 1280
    .line 1281
    invoke-direct {v3, v2, v4}, LA9/d;-><init>(Ljava/lang/Object;I)V

    .line 1282
    .line 1283
    .line 1284
    const-string v4, "GoldHearingDetectFragmentV2"

    .line 1285
    .line 1286
    invoke-static {v4, v3}, Lcom/oplus/melody/common/util/y;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 1287
    .line 1288
    .line 1289
    iget-object v2, v2, LIc/E;->v:Landroidx/fragment/app/Fragment;

    .line 1290
    .line 1291
    instance-of v3, v2, Lcom/oplus/melody/ui/component/hearingenhance/EarScanFragmentV2;

    .line 1292
    .line 1293
    if-eqz v3, :cond_513

    .line 1294
    .line 1295
    check-cast v2, Lcom/oplus/melody/ui/component/hearingenhance/EarScanFragmentV2;

    .line 1296
    .line 1297
    invoke-virtual {v2}, Lcom/oplus/melody/ui/component/hearingenhance/EarScanFragmentV2;->B()V

    .line 1298
    .line 1299
    .line 1300
    :cond_513
    const/4 v6, 0x1

    .line 1301
    iput-boolean v6, v0, LIc/h1;->p:Z

    .line 1302
    .line 1303
    return-void

    .line 1304
    :pswitch_517
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1305
    .line 1306
    check-cast v0, LIc/c1;

    .line 1307
    .line 1308
    iget-object v0, v0, LIc/c1;->G:Lcom/oplus/melody/ui/component/hearingenhance/HearingEnhancementViewModel;

    .line 1309
    .line 1310
    iget-object v2, v0, Lcom/oplus/melody/ui/component/hearingenhance/HearingEnhancementViewModel;->d:Ljava/lang/String;

    .line 1311
    .line 1312
    iget-object v3, v0, Lcom/oplus/melody/ui/component/hearingenhance/HearingEnhancementViewModel;->c:Ljava/lang/String;

    .line 1313
    .line 1314
    invoke-virtual {v0, v3}, Lcom/oplus/melody/ui/component/hearingenhance/HearingEnhancementViewModel;->f(Ljava/lang/String;)Lcom/oplus/melody/model/repository/earphone/EarphoneDTO;

    .line 1315
    .line 1316
    .line 1317
    move-result-object v0

    .line 1318
    invoke-static {v0}, Lcom/oplus/melody/model/repository/earphone/Q;->x(Lcom/oplus/melody/model/repository/earphone/EarphoneDTO;)Ljava/lang/String;

    .line 1319
    .line 1320
    .line 1321
    move-result-object v6

    .line 1322
    iget-object v0, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1323
    .line 1324
    check-cast v0, Lcom/oplus/melody/model/db/HearingEnhancementEntity;

    .line 1325
    .line 1326
    invoke-static {v0}, LIc/l;->a(Lcom/oplus/melody/model/db/HearingEnhancementEntity;)Ljava/lang/String;

    .line 1327
    .line 1328
    .line 1329
    move-result-object v7

    .line 1330
    const/16 v4, 0xc

    .line 1331
    .line 1332
    const/4 v5, 0x0

    .line 1333
    invoke-static/range {v2 .. v7}, LRa/B;->o(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 1334
    .line 1335
    .line 1336
    return-void

    .line 1337
    :pswitch_538
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1338
    .line 1339
    check-cast v0, LIc/p0;

    .line 1340
    .line 1341
    iget-object v2, v0, LIc/p0;->I0:Lcom/oplus/melody/ui/component/hearingenhance/HearingEnhancementViewModel;

    .line 1342
    .line 1343
    iget-object v3, v2, Lcom/oplus/melody/ui/component/hearingenhance/HearingEnhancementViewModel;->d:Ljava/lang/String;

    .line 1344
    .line 1345
    iget-object v4, v2, Lcom/oplus/melody/ui/component/hearingenhance/HearingEnhancementViewModel;->c:Ljava/lang/String;

    .line 1346
    .line 1347
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1348
    .line 1349
    check-cast v2, Lcom/oplus/melody/model/repository/earphone/EarphoneDTO;

    .line 1350
    .line 1351
    invoke-static {v2}, Lcom/oplus/melody/model/repository/earphone/Q;->x(Lcom/oplus/melody/model/repository/earphone/EarphoneDTO;)Ljava/lang/String;

    .line 1352
    .line 1353
    .line 1354
    move-result-object v7

    .line 1355
    iget-object v0, v0, LIc/p0;->t0:Lcom/oplus/melody/model/db/HearingEnhancementEntity;

    .line 1356
    .line 1357
    invoke-static {v0}, LIc/l;->a(Lcom/oplus/melody/model/db/HearingEnhancementEntity;)Ljava/lang/String;

    .line 1358
    .line 1359
    .line 1360
    move-result-object v8

    .line 1361
    const/16 v5, 0xb

    .line 1362
    .line 1363
    const/4 v6, 0x0

    .line 1364
    invoke-static/range {v3 .. v8}, LRa/B;->o(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 1365
    .line 1366
    .line 1367
    return-void

    .line 1368
    :pswitch_557
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1369
    .line 1370
    check-cast v0, Lcom/oplus/melody/ui/component/detail/fitdetection/FitDetectionItem;

    .line 1371
    .line 1372
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1373
    .line 1374
    check-cast v2, Lcom/oplus/melody/model/repository/earphone/EarphoneDTO;

    .line 1375
    .line 1376
    invoke-static {v0, v2}, Lcom/oplus/melody/ui/component/detail/fitdetection/FitDetectionItem;->n(Lcom/oplus/melody/ui/component/detail/fitdetection/FitDetectionItem;Lcom/oplus/melody/model/repository/earphone/EarphoneDTO;)V

    .line 1377
    .line 1378
    .line 1379
    return-void

    .line 1380
    :pswitch_563
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1381
    .line 1382
    check-cast v0, LF8/j;

    .line 1383
    .line 1384
    iget-object v2, v0, LF8/j;->p:Landroid/bluetooth/BluetoothGatt;

    .line 1385
    .line 1386
    if-eqz v2, :cond_5d0

    .line 1387
    .line 1388
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1389
    .line 1390
    check-cast v2, Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 1391
    .line 1392
    if-eqz v2, :cond_5d0

    .line 1393
    .line 1394
    sget-object v3, LF8/m;->I:Ljava/util/UUID;

    .line 1395
    .line 1396
    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothGattCharacteristic;->getDescriptor(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattDescriptor;

    .line 1397
    .line 1398
    .line 1399
    move-result-object v2

    .line 1400
    const-string v3, "m_bt_le.GattConnection"

    .line 1401
    .line 1402
    if-nez v2, :cond_58d

    .line 1403
    .line 1404
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1405
    .line 1406
    const-string v4, "setNotification Failed to getDescriptor."

    .line 1407
    .line 1408
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1409
    .line 1410
    .line 1411
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1412
    .line 1413
    .line 1414
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1415
    .line 1416
    .line 1417
    move-result-object v0

    .line 1418
    invoke-static {v3, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1419
    .line 1420
    .line 1421
    goto :goto_5d0

    .line 1422
    :cond_58d
    sget-object v4, Landroid/bluetooth/BluetoothGattDescriptor;->ENABLE_NOTIFICATION_VALUE:[B

    .line 1423
    .line 1424
    iget-object v5, v0, LF8/j;->p:Landroid/bluetooth/BluetoothGatt;

    .line 1425
    .line 1426
    invoke-static {v5, v2, v4}, LF2/g;->a(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;[B)I

    .line 1427
    .line 1428
    .line 1429
    move-result v2

    .line 1430
    const-string v4, ", "

    .line 1431
    .line 1432
    if-eqz v2, :cond_5b1

    .line 1433
    .line 1434
    new-instance v5, Ljava/lang/StringBuilder;

    .line 1435
    .line 1436
    const-string v6, "setNotification Failed to writeDescriptor. enableNotify = true, resultCode = "

    .line 1437
    .line 1438
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1439
    .line 1440
    .line 1441
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1442
    .line 1443
    .line 1444
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1445
    .line 1446
    .line 1447
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1448
    .line 1449
    .line 1450
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1451
    .line 1452
    .line 1453
    move-result-object v0

    .line 1454
    invoke-static {v3, v0}, LQ8/a;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1455
    .line 1456
    .line 1457
    goto :goto_5d0

    .line 1458
    :cond_5b1
    sget-object v5, LQ8/a;->a:Lcom/oplus/melody/common/util/y$a;

    .line 1459
    .line 1460
    invoke-static {}, Lcom/oplus/melody/common/util/y;->l()Z

    .line 1461
    .line 1462
    .line 1463
    move-result v5

    .line 1464
    if-eqz v5, :cond_5d0

    .line 1465
    .line 1466
    new-instance v5, Ljava/lang/StringBuilder;

    .line 1467
    .line 1468
    const-string v6, "setNotification success to writeDescriptor. enableNotify = true, resultCode: "

    .line 1469
    .line 1470
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1471
    .line 1472
    .line 1473
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1474
    .line 1475
    .line 1476
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1477
    .line 1478
    .line 1479
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1480
    .line 1481
    .line 1482
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1483
    .line 1484
    .line 1485
    move-result-object v0

    .line 1486
    invoke-static {v3, v0}, LQ8/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 1487
    .line 1488
    .line 1489
    :cond_5d0
    :goto_5d0
    return-void

    .line 1490
    :pswitch_5d1
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1491
    .line 1492
    check-cast v0, LD/g$c;

    .line 1493
    .line 1494
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1495
    .line 1496
    check-cast v2, Landroid/graphics/Typeface;

    .line 1497
    .line 1498
    invoke-static {v0, v2}, LD/g$c;->a(LD/g$c;Landroid/graphics/Typeface;)V

    .line 1499
    .line 1500
    .line 1501
    return-void

    .line 1502
    :pswitch_5dd
    iget-object v0, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1503
    .line 1504
    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 1505
    .line 1506
    iget-object v2, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1507
    .line 1508
    check-cast v2, LB8/v;

    .line 1509
    .line 1510
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1511
    .line 1512
    .line 1513
    invoke-static {v0}, LB8/v;->j(Landroid/bluetooth/BluetoothDevice;)V

    .line 1514
    .line 1515
    .line 1516
    return-void

    .line 1517
    :pswitch_5ec
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1518
    .line 1519
    check-cast v0, Lfeedbackf/feedbackh$feedbacka;

    .line 1520
    .line 1521
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1522
    .line 1523
    check-cast v2, Lfeedbackf/feedbackh;

    .line 1524
    .line 1525
    invoke-virtual {v0, v2}, Lfeedbackf/feedbackh$feedbacka;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1526
    .line 1527
    .line 1528
    return-void

    .line 1529
    :pswitch_5f8
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1530
    .line 1531
    check-cast v0, LAc/e$a;

    .line 1532
    .line 1533
    iget-object v0, v0, LAc/e$a;->a:LAc/e;

    .line 1534
    .line 1535
    iget-object v3, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1536
    .line 1537
    check-cast v3, Ljava/lang/String;

    .line 1538
    .line 1539
    invoke-static {v0, v3}, LAc/e;->f(LAc/e;Ljava/lang/String;)I

    .line 1540
    .line 1541
    .line 1542
    move-result v3

    .line 1543
    const/4 v4, -0x1

    .line 1544
    if-ne v3, v4, :cond_611

    .line 1545
    .line 1546
    const-string v0, "ZenModeSceneAdapter"

    .line 1547
    .line 1548
    const-string v2, "onCancel, position is invalid"

    .line 1549
    .line 1550
    invoke-static {v0, v2}, Lcom/oplus/melody/common/util/y;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 1551
    .line 1552
    .line 1553
    goto :goto_61e

    .line 1554
    :cond_611
    iget-object v4, v0, LAc/e;->e:Ljava/util/ArrayList;

    .line 1555
    .line 1556
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1557
    .line 1558
    .line 1559
    move-result-object v4

    .line 1560
    check-cast v4, LAc/g;

    .line 1561
    .line 1562
    iput-boolean v2, v4, LAc/g;->g:Z

    .line 1563
    .line 1564
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 1565
    .line 1566
    .line 1567
    :goto_61e
    return-void

    .line 1568
    :pswitch_61f
    iget-object v0, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1569
    .line 1570
    check-cast v0, LAb/Z$h;

    .line 1571
    .line 1572
    iget-object v0, v0, LAb/Z$h;->b:LAb/Z;

    .line 1573
    .line 1574
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1575
    .line 1576
    check-cast v2, Landroidx/preference/Preference;

    .line 1577
    .line 1578
    invoke-virtual {v0, v2}, LAb/Z;->y(Landroidx/preference/Preference;)V

    .line 1579
    .line 1580
    .line 1581
    instance-of v0, v2, Landroidx/preference/TwoStatePreference;

    .line 1582
    .line 1583
    if-eqz v0, :cond_636

    .line 1584
    .line 1585
    check-cast v2, Landroidx/preference/TwoStatePreference;

    .line 1586
    .line 1587
    const/4 v6, 0x1

    .line 1588
    invoke-virtual {v2, v6}, Landroidx/preference/TwoStatePreference;->setChecked(Z)V

    .line 1589
    .line 1590
    .line 1591
    :cond_636
    return-void

    .line 1592
    :pswitch_637
    const-string v0, "dispatchEqShareSaveToAlbum result"

    .line 1593
    .line 1594
    iget-object v2, v1, LAb/O;->b:Ljava/lang/Object;

    .line 1595
    .line 1596
    check-cast v2, LAb/Z;

    .line 1597
    .line 1598
    invoke-virtual {v2, v0}, LAb/Z;->C(Ljava/lang/String;)Landroidx/fragment/app/f;

    .line 1599
    .line 1600
    .line 1601
    move-result-object v0

    .line 1602
    if-nez v0, :cond_644

    .line 1603
    .line 1604
    goto :goto_65f

    .line 1605
    :cond_644
    iget-object v2, v1, LAb/O;->c:Ljava/lang/Object;

    .line 1606
    .line 1607
    check-cast v2, Landroid/net/Uri;

    .line 1608
    .line 1609
    if-eqz v2, :cond_655

    .line 1610
    .line 1611
    const v2, 0x7f1209be

    .line 1612
    .line 1613
    .line 1614
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1615
    .line 1616
    .line 1617
    move-result-object v2

    .line 1618
    invoke-static {v0, v2}, LX1/a;->H(Landroid/content/Context;Ljava/lang/String;)V

    .line 1619
    .line 1620
    .line 1621
    goto :goto_65f

    .line 1622
    :cond_655
    const v2, 0x7f1209bd

    .line 1623
    .line 1624
    .line 1625
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1626
    .line 1627
    .line 1628
    move-result-object v2

    .line 1629
    invoke-static {v0, v2}, LX1/a;->H(Landroid/content/Context;Ljava/lang/String;)V

    .line 1630
    .line 1631
    .line 1632
    :goto_65f
    return-void

    .line 1633
    :pswitch_data_660
    .packed-switch 0x0
        :pswitch_637
        :pswitch_61f
        :pswitch_5f8
        :pswitch_5ec
        :pswitch_5dd
        :pswitch_5d1
        :pswitch_563
        :pswitch_557
        :pswitch_538
        :pswitch_517
        :pswitch_4f1
        :pswitch_4df
        :pswitch_4d3
        :pswitch_4b9
        :pswitch_495
        :pswitch_489
        :pswitch_389
        :pswitch_364
        :pswitch_32b
        :pswitch_224
        :pswitch_1f4
        :pswitch_1e5
        :pswitch_19c
        :pswitch_183
        :pswitch_175
        :pswitch_169
        :pswitch_153
        :pswitch_137
        :pswitch_10e
    .end packed-switch
.end method
