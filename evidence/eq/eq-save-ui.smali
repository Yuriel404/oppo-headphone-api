.method public final onClick(Landroid/view/View;)V
    .registers 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v2, 0x2

    .line 4
    const/4 v3, 0x1

    .line 5
    const/4 v4, 0x0

    .line 6
    iget v5, v0, LAb/J;->a:I

    .line 7
    .line 8
    packed-switch v5, :pswitch_data_444

    .line 9
    .line 10
    .line 11
    iget-object v1, v0, LAb/J;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Lcom/oplus/melody/ui/component/detail/weardetection/ChannelSwitchItem;

    .line 14
    .line 15
    iget-object v2, v0, LAb/J;->c:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v2, Ljava/lang/String;

    .line 18
    .line 19
    move-object/from16 v3, p1

    .line 20
    .line 21
    invoke-static {v1, v2, v3}, Lcom/oplus/melody/ui/component/detail/weardetection/ChannelSwitchItem;->j(Lcom/oplus/melody/ui/component/detail/weardetection/ChannelSwitchItem;Ljava/lang/String;Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_18
    iget-object v5, v0, LAb/J;->b:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v5, Lh4/e;

    .line 28
    .line 29
    iget-object v6, v0, LAb/J;->c:Ljava/lang/Object;

    .line 30
    .line 31
    move-object v7, v6

    .line 32
    check-cast v7, Lh4/f;

    .line 33
    .line 34
    iget-object v6, v5, Lh4/e;->d:Lcom/google/gson/internal/a;

    .line 35
    .line 36
    if-eqz v6, :cond_2cc

    .line 37
    .line 38
    invoke-virtual {v7}, Lh4/f;->getConnectionState()I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    if-eq v6, v3, :cond_2cc

    .line 43
    .line 44
    invoke-virtual {v7}, Lh4/f;->getConnectionState()I

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    if-eq v6, v2, :cond_2cc

    .line 49
    .line 50
    iget-object v5, v5, Lh4/e;->d:Lcom/google/gson/internal/a;

    .line 51
    .line 52
    iget-object v5, v5, Lcom/google/gson/internal/a;->b:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v5, Lcom/heytap/headset/component/scan/ScanFragment;

    .line 55
    .line 56
    sget-boolean v6, LU8/b;->l:Z

    .line 57
    .line 58
    if-nez v6, :cond_75

    .line 59
    .line 60
    invoke-virtual {v7}, Lh4/f;->getDeviceName()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-static {}, LLa/a;->f()LLa/a;

    .line 65
    .line 66
    .line 67
    move-result-object v8

    .line 68
    invoke-virtual {v8}, LLa/a;->g()Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object v8

    .line 72
    invoke-static {v6, v8}, Lcom/oplus/melody/common/util/S;->h(Ljava/lang/String;Ljava/util/List;)I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    const/4 v8, -0x1

    .line 77
    if-ne v6, v8, :cond_60

    .line 78
    .line 79
    sget v8, LBa/a;->c:I

    .line 80
    .line 81
    invoke-static {}, LBa/a$a;->a()LBa/a;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    if-eqz v8, :cond_75

    .line 86
    .line 87
    invoke-virtual {v7}, Lh4/f;->getMacAddress()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v9

    .line 91
    invoke-virtual {v8, v9}, LBa/a;->d(Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v8

    .line 95
    if-ne v8, v3, :cond_75

    .line 96
    .line 97
    :cond_60
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/f;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const-string v2, "requireActivity(...)"

    .line 102
    .line 103
    invoke-static {v1, v2}, Lkotlin/jvm/internal/i;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v7}, Lh4/f;->getMacAddress()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-static {v2}, Lkotlin/jvm/internal/i;->c(Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v1, v6, v2}, Lad/g;->a(Landroid/content/Context;ILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    goto/16 :goto_2cc

    .line 117
    .line 118
    :cond_75
    invoke-virtual {v7}, Lh4/f;->getMacAddress()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    iput-object v6, v5, Lcom/heytap/headset/component/scan/ScanFragment;->G:Ljava/lang/String;

    .line 123
    .line 124
    iget-boolean v6, v5, Lcom/heytap/headset/component/scan/ScanFragment;->E:Z

    .line 125
    .line 126
    if-eqz v6, :cond_1c9

    .line 127
    .line 128
    iput-boolean v4, v5, Lcom/heytap/headset/component/scan/ScanFragment;->E:Z

    .line 129
    .line 130
    iget-object v6, v5, Lcom/heytap/headset/component/scan/ScanFragment;->A:Landroidx/appcompat/widget/AppCompatTextView;

    .line 131
    .line 132
    const-string v8, "mControlTips"

    .line 133
    .line 134
    if-eqz v6, :cond_1c3

    .line 135
    .line 136
    sget-object v9, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 137
    .line 138
    iget-object v10, v5, Lcom/heytap/headset/component/scan/ScanFragment;->y:Landroid/widget/LinearLayout;

    .line 139
    .line 140
    const-string v11, "mScanningTipViews"

    .line 141
    .line 142
    if-eqz v10, :cond_1bd

    .line 143
    .line 144
    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    .line 145
    .line 146
    .line 147
    move-result v10

    .line 148
    int-to-float v10, v10

    .line 149
    iget-object v12, v5, Lcom/heytap/headset/component/scan/ScanFragment;->y:Landroid/widget/LinearLayout;

    .line 150
    .line 151
    if-eqz v12, :cond_1b7

    .line 152
    .line 153
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 154
    .line 155
    .line 156
    move-result-object v12

    .line 157
    instance-of v13, v12, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 158
    .line 159
    if-eqz v13, :cond_a3

    .line 160
    .line 161
    check-cast v12, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 162
    .line 163
    goto :goto_a4

    .line 164
    :cond_a3
    const/4 v12, 0x0

    .line 165
    :goto_a4
    if-eqz v12, :cond_a9

    .line 166
    .line 167
    iget v12, v12, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 168
    .line 169
    goto :goto_aa

    .line 170
    :cond_a9
    move v12, v4

    .line 171
    :goto_aa
    int-to-float v12, v12

    .line 172
    add-float/2addr v10, v12

    .line 173
    neg-float v10, v10

    .line 174
    new-array v12, v3, [F

    .line 175
    .line 176
    aput v10, v12, v4

    .line 177
    .line 178
    invoke-static {v6, v9, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 179
    .line 180
    .line 181
    move-result-object v6

    .line 182
    const-string v10, "ofFloat(...)"

    .line 183
    .line 184
    invoke-static {v6, v10}, Lkotlin/jvm/internal/i;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    new-instance v12, Landroid/view/animation/DecelerateInterpolator;

    .line 188
    .line 189
    invoke-direct {v12}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v6, v12}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 193
    .line 194
    .line 195
    const-wide/16 v12, 0x1f4

    .line 196
    .line 197
    invoke-virtual {v6, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 198
    .line 199
    .line 200
    iget-object v14, v5, Lcom/heytap/headset/component/scan/ScanFragment;->B:Landroidx/recyclerview/widget/COUIRecyclerView;

    .line 201
    .line 202
    if-eqz v14, :cond_1af

    .line 203
    .line 204
    iget-object v15, v5, Lcom/heytap/headset/component/scan/ScanFragment;->y:Landroid/widget/LinearLayout;

    .line 205
    .line 206
    if-eqz v15, :cond_1a9

    .line 207
    .line 208
    invoke-virtual {v15}, Landroid/view/View;->getHeight()I

    .line 209
    .line 210
    .line 211
    move-result v15

    .line 212
    int-to-float v15, v15

    .line 213
    const/16 v16, 0x0

    .line 214
    .line 215
    iget-object v1, v5, Lcom/heytap/headset/component/scan/ScanFragment;->y:Landroid/widget/LinearLayout;

    .line 216
    .line 217
    if-eqz v1, :cond_1a5

    .line 218
    .line 219
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    move/from16 v17, v4

    .line 224
    .line 225
    instance-of v4, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 226
    .line 227
    if-eqz v4, :cond_e7

    .line 228
    .line 229
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 230
    .line 231
    goto :goto_e9

    .line 232
    :cond_e7
    move-object/from16 v1, v16

    .line 233
    .line 234
    :goto_e9
    if-eqz v1, :cond_ee

    .line 235
    .line 236
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 237
    .line 238
    goto :goto_f0

    .line 239
    :cond_ee
    move/from16 v1, v17

    .line 240
    .line 241
    :goto_f0
    int-to-float v1, v1

    .line 242
    add-float/2addr v15, v1

    .line 243
    neg-float v1, v15

    .line 244
    new-array v4, v3, [F

    .line 245
    .line 246
    aput v1, v4, v17

    .line 247
    .line 248
    invoke-static {v14, v9, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    invoke-static {v1, v10}, Lkotlin/jvm/internal/i;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    new-instance v4, Landroid/view/animation/DecelerateInterpolator;

    .line 256
    .line 257
    invoke-direct {v4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v1, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v1, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 264
    .line 265
    .line 266
    iget-object v4, v5, Lcom/heytap/headset/component/scan/ScanFragment;->y:Landroid/widget/LinearLayout;

    .line 267
    .line 268
    if-eqz v4, :cond_1a1

    .line 269
    .line 270
    sget-object v9, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 271
    .line 272
    new-array v11, v2, [F

    .line 273
    .line 274
    fill-array-data v11, :array_454

    .line 275
    .line 276
    .line 277
    invoke-static {v4, v9, v11}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 278
    .line 279
    .line 280
    move-result-object v4

    .line 281
    invoke-static {v4, v10}, Lkotlin/jvm/internal/i;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    new-instance v9, Landroid/view/animation/LinearInterpolator;

    .line 285
    .line 286
    invoke-direct {v9}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 287
    .line 288
    .line 289
    invoke-virtual {v4, v9}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {v4, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 293
    .line 294
    .line 295
    new-instance v9, Landroid/animation/AnimatorSet;

    .line 296
    .line 297
    invoke-direct {v9}, Landroid/animation/AnimatorSet;-><init>()V

    .line 298
    .line 299
    .line 300
    const/4 v10, 0x3

    .line 301
    new-array v10, v10, [Landroid/animation/Animator;

    .line 302
    .line 303
    aput-object v6, v10, v17

    .line 304
    .line 305
    aput-object v1, v10, v3

    .line 306
    .line 307
    aput-object v4, v10, v2

    .line 308
    .line 309
    invoke-virtual {v9, v10}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 310
    .line 311
    .line 312
    new-instance v1, Lh4/l;

    .line 313
    .line 314
    invoke-direct {v1, v5}, Lh4/l;-><init>(Lcom/heytap/headset/component/scan/ScanFragment;)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {v9, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {v9}, Landroid/animation/AnimatorSet;->start()V

    .line 321
    .line 322
    .line 323
    iget-object v1, v5, Lcom/heytap/headset/component/scan/ScanFragment;->z:Lcom/oplus/melody/ui/widget/MelodyLottieAnimationView;

    .line 324
    .line 325
    if-eqz v1, :cond_19b

    .line 326
    .line 327
    invoke-virtual {v1}, Lcom/airbnb/lottie/LottieAnimationView;->cancelAnimation()V

    .line 328
    .line 329
    .line 330
    iget-object v1, v5, Lcom/heytap/headset/component/scan/ScanFragment;->A:Landroidx/appcompat/widget/AppCompatTextView;

    .line 331
    .line 332
    if-eqz v1, :cond_197

    .line 333
    .line 334
    const v4, 0x7f1202a4

    .line 335
    .line 336
    .line 337
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    .line 338
    .line 339
    .line 340
    iget-object v1, v5, Lcom/heytap/headset/component/scan/ScanFragment;->D:Lcom/heytap/headset/component/scan/ScanViewModel;

    .line 341
    .line 342
    if-eqz v1, :cond_17f

    .line 343
    .line 344
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Landroidx/lifecycle/m;

    .line 345
    .line 346
    .line 347
    move-result-object v4

    .line 348
    const-string v6, "getViewLifecycleOwner(...)"

    .line 349
    .line 350
    invoke-static {v4, v6}, Lkotlin/jvm/internal/i;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    move/from16 v6, v17

    .line 354
    .line 355
    iput-boolean v6, v1, Lcom/heytap/headset/component/scan/ScanViewModel;->e:Z

    .line 356
    .line 357
    iget-object v6, v1, Lcom/heytap/headset/component/scan/ScanViewModel;->c:Landroidx/lifecycle/t;

    .line 358
    .line 359
    if-eqz v6, :cond_179

    .line 360
    .line 361
    invoke-virtual {v6, v4}, Landroidx/lifecycle/s;->k(Landroidx/lifecycle/m;)V

    .line 362
    .line 363
    .line 364
    iget-object v1, v1, Lcom/heytap/headset/component/scan/ScanViewModel;->d:Landroidx/lifecycle/t;

    .line 365
    .line 366
    if-eqz v1, :cond_173

    .line 367
    .line 368
    invoke-virtual {v1, v4}, Landroidx/lifecycle/s;->k(Landroidx/lifecycle/m;)V

    .line 369
    .line 370
    .line 371
    goto :goto_17f

    .line 372
    :cond_173
    const-string v1, "mBrScanRemoveLiveData"

    .line 373
    .line 374
    invoke-static {v1}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 375
    .line 376
    .line 377
    throw v16

    .line 378
    :cond_179
    const-string v1, "mBleScanRemoveLiveData"

    .line 379
    .line 380
    invoke-static {v1}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    throw v16

    .line 384
    :cond_17f
    :goto_17f
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/f;

    .line 385
    .line 386
    .line 387
    move-result-object v1

    .line 388
    check-cast v1, Landroidx/appcompat/app/h;

    .line 389
    .line 390
    if-eqz v1, :cond_18c

    .line 391
    .line 392
    invoke-virtual {v1}, Landroidx/appcompat/app/h;->getSupportActionBar()Landroidx/appcompat/app/a;

    .line 393
    .line 394
    .line 395
    move-result-object v1

    .line 396
    goto :goto_18e

    .line 397
    :cond_18c
    move-object/from16 v1, v16

    .line 398
    .line 399
    :goto_18e
    if-eqz v1, :cond_1cb

    .line 400
    .line 401
    const v4, 0x7f12022e

    .line 402
    .line 403
    .line 404
    invoke-virtual {v1, v4}, Landroidx/appcompat/app/a;->t(I)V

    .line 405
    .line 406
    .line 407
    goto :goto_1cb

    .line 408
    :cond_197
    invoke-static {v8}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    throw v16

    .line 412
    :cond_19b
    const-string v1, "mScanningLottieSmall"

    .line 413
    .line 414
    invoke-static {v1}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 415
    .line 416
    .line 417
    throw v16

    .line 418
    :cond_1a1
    invoke-static {v11}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    throw v16

    .line 422
    :cond_1a5
    invoke-static {v11}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 423
    .line 424
    .line 425
    throw v16

    .line 426
    :cond_1a9
    const/16 v16, 0x0

    .line 427
    .line 428
    invoke-static {v11}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 429
    .line 430
    .line 431
    throw v16

    .line 432
    :cond_1af
    const/16 v16, 0x0

    .line 433
    .line 434
    const-string v1, "mScanRecyclerView"

    .line 435
    .line 436
    invoke-static {v1}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    throw v16

    .line 440
    :cond_1b7
    const/16 v16, 0x0

    .line 441
    .line 442
    invoke-static {v11}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 443
    .line 444
    .line 445
    throw v16

    .line 446
    :cond_1bd
    const/16 v16, 0x0

    .line 447
    .line 448
    invoke-static {v11}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 449
    .line 450
    .line 451
    throw v16

    .line 452
    :cond_1c3
    const/16 v16, 0x0

    .line 453
    .line 454
    invoke-static {v8}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 455
    .line 456
    .line 457
    throw v16

    .line 458
    :cond_1c9
    const/16 v16, 0x0

    .line 459
    .line 460
    :cond_1cb
    :goto_1cb
    invoke-virtual {v7}, Lh4/f;->getViewType()I

    .line 461
    .line 462
    .line 463
    move-result v1

    .line 464
    const-string v4, "ScanFragment"

    .line 465
    .line 466
    if-ne v1, v2, :cond_246

    .line 467
    .line 468
    sget-boolean v1, LU8/b;->l:Z

    .line 469
    .line 470
    if-eqz v1, :cond_1f6

    .line 471
    .line 472
    invoke-static {}, LWa/a;->u()LWa/a;

    .line 473
    .line 474
    .line 475
    move-result-object v1

    .line 476
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 477
    .line 478
    .line 479
    sget-object v1, LXa/h;->h:LGe/b;

    .line 480
    .line 481
    const-string v1, "/heymelody_app/device_list_combine"

    .line 482
    .line 483
    invoke-static {v1}, LXa/h$a;->a(Ljava/lang/String;)LXa/h;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    invoke-virtual {v1, v3}, LXa/h;->a(I)V

    .line 488
    .line 489
    .line 490
    const-string v2, "route_from"

    .line 491
    .line 492
    invoke-virtual {v1, v2, v4}, LXa/h;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 493
    .line 494
    .line 495
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/f;

    .line 496
    .line 497
    .line 498
    move-result-object v2

    .line 499
    invoke-virtual {v1, v2}, LXa/h;->b(Landroid/content/Context;)V

    .line 500
    .line 501
    .line 502
    goto :goto_23d

    .line 503
    :cond_1f6
    sget-object v1, Lqa/b;->c:Ljava/lang/Object;

    .line 504
    .line 505
    invoke-static {}, Lqa/b$a;->a()Lqa/b;

    .line 506
    .line 507
    .line 508
    move-result-object v1

    .line 509
    invoke-virtual {v7}, Lh4/f;->getMacAddress()Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object v2

    .line 513
    invoke-static {v2}, Lkotlin/jvm/internal/i;->c(Ljava/lang/Object;)V

    .line 514
    .line 515
    .line 516
    invoke-virtual {v7}, Lh4/f;->getDeviceName()Ljava/lang/String;

    .line 517
    .line 518
    .line 519
    move-result-object v4

    .line 520
    invoke-virtual {v7}, Lh4/f;->getProductId()Ljava/lang/String;

    .line 521
    .line 522
    .line 523
    move-result-object v6

    .line 524
    invoke-virtual {v7}, Lh4/f;->getCoverImage()Ljava/lang/String;

    .line 525
    .line 526
    .line 527
    move-result-object v8

    .line 528
    invoke-virtual {v1, v2, v4, v6, v8}, Lqa/b;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 529
    .line 530
    .line 531
    invoke-static {}, LWa/a;->u()LWa/a;

    .line 532
    .line 533
    .line 534
    move-result-object v1

    .line 535
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 536
    .line 537
    .line 538
    sget-object v1, LXa/h;->h:LGe/b;

    .line 539
    .line 540
    const-string v1, "/ui/detail"

    .line 541
    .line 542
    invoke-static {v1}, LXa/h$a;->a(Ljava/lang/String;)LXa/h;

    .line 543
    .line 544
    .line 545
    move-result-object v1

    .line 546
    const-string v2, "device_mac_info"

    .line 547
    .line 548
    invoke-virtual {v7}, Lh4/f;->getMacAddress()Ljava/lang/String;

    .line 549
    .line 550
    .line 551
    move-result-object v4

    .line 552
    invoke-virtual {v1, v2, v4}, LXa/h;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    .line 554
    .line 555
    const-string v2, "device_name"

    .line 556
    .line 557
    invoke-virtual {v7}, Lh4/f;->getDeviceName()Ljava/lang/String;

    .line 558
    .line 559
    .line 560
    move-result-object v4

    .line 561
    invoke-virtual {v1, v2, v4}, LXa/h;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    invoke-virtual {v1, v3}, LXa/h;->a(I)V

    .line 565
    .line 566
    .line 567
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/f;

    .line 568
    .line 569
    .line 570
    move-result-object v2

    .line 571
    invoke-virtual {v1, v2}, LXa/h;->b(Landroid/content/Context;)V

    .line 572
    .line 573
    .line 574
    :goto_23d
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/f;

    .line 575
    .line 576
    .line 577
    move-result-object v1

    .line 578
    invoke-virtual {v1}, Landroid/app/Activity;->finishAffinity()V

    .line 579
    .line 580
    .line 581
    goto/16 :goto_2cc

    .line 582
    .line 583
    :cond_246
    new-instance v1, Ldd/h;

    .line 584
    .line 585
    const/4 v2, 0x7

    .line 586
    invoke-direct {v1, v7, v2}, Ldd/h;-><init>(Ljava/lang/Object;I)V

    .line 587
    .line 588
    .line 589
    invoke-static {v4, v1}, Lcom/oplus/melody/common/util/y;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 590
    .line 591
    .line 592
    invoke-virtual {v7}, Lh4/f;->getType()Ljava/lang/String;

    .line 593
    .line 594
    .line 595
    move-result-object v1

    .line 596
    invoke-static {v1}, Lcom/oplus/melody/common/util/Y;->n(Ljava/lang/String;)Z

    .line 597
    .line 598
    .line 599
    move-result v1

    .line 600
    if-nez v1, :cond_299

    .line 601
    .line 602
    invoke-virtual {v7}, Lh4/f;->getPariState()Ljava/lang/Integer;

    .line 603
    .line 604
    .line 605
    move-result-object v1

    .line 606
    if-nez v1, :cond_260

    .line 607
    .line 608
    goto :goto_266

    .line 609
    :cond_260
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 610
    .line 611
    .line 612
    move-result v1

    .line 613
    if-eq v1, v3, :cond_299

    .line 614
    .line 615
    :goto_266
    invoke-virtual {v7}, Lh4/f;->getViewType()I

    .line 616
    .line 617
    .line 618
    move-result v1

    .line 619
    if-ne v1, v3, :cond_26d

    .line 620
    .line 621
    goto :goto_299

    .line 622
    :cond_26d
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    .line 623
    .line 624
    .line 625
    move-result-object v1

    .line 626
    sget-object v2, LU8/m;->d:LU8/m;

    .line 627
    .line 628
    invoke-virtual {v7}, Lh4/f;->getMacAddress()Ljava/lang/String;

    .line 629
    .line 630
    .line 631
    move-result-object v6

    .line 632
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 633
    .line 634
    .line 635
    invoke-static {v1, v6}, LU8/m;->h(Landroid/bluetooth/BluetoothAdapter;Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    .line 636
    .line 637
    .line 638
    move-result-object v2

    .line 639
    if-nez v2, :cond_286

    .line 640
    .line 641
    const-string v1, "initView setItemClickListener bluetoothAdapter is null!"

    .line 642
    .line 643
    invoke-static {v4, v1}, Lcom/oplus/melody/common/util/y;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 644
    .line 645
    .line 646
    goto :goto_2cc

    .line 647
    :cond_286
    sget-object v4, Lcom/oplus/melody/common/util/k;->a:Lcom/heytap/headset/HeyMelodyApplication;

    .line 648
    .line 649
    if-eqz v4, :cond_293

    .line 650
    .line 651
    new-instance v6, Lh4/n;

    .line 652
    .line 653
    invoke-direct {v6, v5, v2, v7}, Lh4/n;-><init>(Lcom/heytap/headset/component/scan/ScanFragment;Landroid/bluetooth/BluetoothDevice;Lh4/f;)V

    .line 654
    .line 655
    .line 656
    invoke-virtual {v1, v4, v6, v3}, Landroid/bluetooth/BluetoothAdapter;->getProfileProxy(Landroid/content/Context;Landroid/bluetooth/BluetoothProfile$ServiceListener;I)Z

    .line 657
    .line 658
    .line 659
    goto :goto_2cc

    .line 660
    :cond_293
    const-string v1, "context"

    .line 661
    .line 662
    invoke-static {v1}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 663
    .line 664
    .line 665
    throw v16

    .line 666
    :cond_299
    :goto_299
    invoke-virtual {v7}, Lh4/f;->getMacAddress()Ljava/lang/String;

    .line 667
    .line 668
    .line 669
    move-result-object v1

    .line 670
    if-eqz v1, :cond_2cc

    .line 671
    .line 672
    const/16 v19, 0x7ff

    .line 673
    .line 674
    const/16 v20, 0x0

    .line 675
    .line 676
    const/4 v8, 0x0

    .line 677
    const/4 v9, 0x0

    .line 678
    const/4 v10, 0x0

    .line 679
    const/4 v11, 0x0

    .line 680
    const/4 v12, 0x0

    .line 681
    const/4 v13, 0x0

    .line 682
    const/4 v14, 0x0

    .line 683
    const/4 v15, 0x0

    .line 684
    const/16 v16, 0x0

    .line 685
    .line 686
    const/16 v17, 0x0

    .line 687
    .line 688
    const/16 v18, 0x0

    .line 689
    .line 690
    invoke-static/range {v7 .. v20}, Lh4/f;->copy$default(Lh4/f;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;ILjava/lang/Integer;IIZILjava/lang/Object;)Lh4/f;

    .line 691
    .line 692
    .line 693
    move-result-object v2

    .line 694
    iput-object v2, v5, Lcom/heytap/headset/component/scan/ScanFragment;->F:Lh4/f;

    .line 695
    .line 696
    iget-object v2, v5, Lcom/heytap/headset/component/scan/ScanFragment;->D:Lcom/heytap/headset/component/scan/ScanViewModel;

    .line 697
    .line 698
    if-eqz v2, :cond_2c2

    .line 699
    .line 700
    invoke-static {}, Lcom/oplus/melody/model/repository/earphone/b;->G()Lcom/oplus/melody/model/repository/earphone/b;

    .line 701
    .line 702
    .line 703
    move-result-object v2

    .line 704
    invoke-virtual {v2, v1}, Lcom/oplus/melody/model/repository/earphone/b;->f(Ljava/lang/String;)V

    .line 705
    .line 706
    .line 707
    :cond_2c2
    sget-object v1, LU8/Q$c;->d:LU8/p;

    .line 708
    .line 709
    new-instance v2, Lh4/g;

    .line 710
    .line 711
    invoke-direct {v2, v5, v3}, Lh4/g;-><init>(Lcom/heytap/headset/component/scan/ScanFragment;I)V

    .line 712
    .line 713
    .line 714
    invoke-virtual {v1, v2}, LU8/p;->execute(Ljava/lang/Runnable;)V

    .line 715
    .line 716
    .line 717
    :cond_2cc
    :goto_2cc
    return-void

    .line 718
    :pswitch_2cd
    iget-object v1, v0, LAb/J;->b:Ljava/lang/Object;

    .line 719
    .line 720
    check-cast v1, Lcom/heytap/headset/component/mydevicelist/a;

    .line 721
    .line 722
    iget-object v2, v1, Lcom/heytap/headset/component/mydevicelist/a;->e:Lcom/heytap/headset/component/mydevicelist/a$c;

    .line 723
    .line 724
    if-eqz v2, :cond_2e0

    .line 725
    .line 726
    iget-boolean v1, v1, Lcom/heytap/headset/component/mydevicelist/a;->f:Z

    .line 727
    .line 728
    if-nez v1, :cond_2e0

    .line 729
    .line 730
    iget-object v1, v0, LAb/J;->c:Ljava/lang/Object;

    .line 731
    .line 732
    check-cast v1, Lf4/a;

    .line 733
    .line 734
    invoke-interface {v2, v1}, Lcom/heytap/headset/component/mydevicelist/a$c;->c(Lf4/a;)V

    .line 735
    .line 736
    .line 737
    :cond_2e0
    return-void

    .line 738
    :pswitch_2e1
    const/16 v16, 0x0

    .line 739
    .line 740
    iget-object v1, v0, LAb/J;->b:Ljava/lang/Object;

    .line 741
    .line 742
    check-cast v1, Ld4/b;

    .line 743
    .line 744
    iget-object v1, v1, Ld4/b;->d:Ld4/d$a;

    .line 745
    .line 746
    if-eqz v1, :cond_32b

    .line 747
    .line 748
    iget-object v2, v0, LAb/J;->c:Ljava/lang/Object;

    .line 749
    .line 750
    check-cast v2, Lr4/a$a;

    .line 751
    .line 752
    invoke-static {}, LWa/a;->u()LWa/a;

    .line 753
    .line 754
    .line 755
    move-result-object v3

    .line 756
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 757
    .line 758
    .line 759
    sget-object v3, LXa/h;->h:LGe/b;

    .line 760
    .line 761
    const-string v3, "/heymelody_app/keep_alive_guide/image"

    .line 762
    .line 763
    invoke-static {v3}, LXa/h$a;->a(Ljava/lang/String;)LXa/h;

    .line 764
    .line 765
    .line 766
    move-result-object v3

    .line 767
    iget-object v1, v1, Ld4/d$a;->a:Ld4/d;

    .line 768
    .line 769
    iget-object v4, v1, Ld4/d;->v:Ljava/lang/String;

    .line 770
    .line 771
    const-string v5, "route_value"

    .line 772
    .line 773
    invoke-virtual {v3, v5, v4}, LXa/h;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 774
    .line 775
    .line 776
    iget-object v4, v1, Ld4/d;->w:Lr4/a$c;

    .line 777
    .line 778
    if-eqz v4, :cond_31b

    .line 779
    .line 780
    invoke-virtual {v4}, Lr4/a$c;->getGallery()Ljava/util/List;

    .line 781
    .line 782
    .line 783
    move-result-object v4

    .line 784
    if-eqz v4, :cond_31b

    .line 785
    .line 786
    invoke-interface {v4, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 787
    .line 788
    .line 789
    move-result v2

    .line 790
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 791
    .line 792
    .line 793
    move-result-object v2

    .line 794
    move-object/from16 v16, v2

    .line 795
    .line 796
    :cond_31b
    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 797
    .line 798
    .line 799
    move-result-object v2

    .line 800
    const-string v4, "route_value2"

    .line 801
    .line 802
    invoke-virtual {v3, v4, v2}, LXa/h;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 803
    .line 804
    .line 805
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/f;

    .line 806
    .line 807
    .line 808
    move-result-object v1

    .line 809
    invoke-virtual {v3, v1}, LXa/h;->b(Landroid/content/Context;)V

    .line 810
    .line 811
    .line 812
    :cond_32b
    return-void

    .line 813
    :pswitch_32c
    const/16 v16, 0x0

    .line 814
    .line 815
    sget v1, Lcom/oplus/melody/heytranslation/language/LanguageChooseView;->r:I

    .line 816
    .line 817
    const/16 v17, 0x0

    .line 818
    .line 819
    invoke-static/range {v17 .. v17}, LMa/z;->a(I)Z

    .line 820
    .line 821
    .line 822
    move-result v1

    .line 823
    if-eqz v1, :cond_339

    .line 824
    .line 825
    goto :goto_348

    .line 826
    :cond_339
    iget-object v1, v0, LAb/J;->c:Ljava/lang/Object;

    .line 827
    .line 828
    check-cast v1, Lcom/oplus/melody/heytranslation/language/LanguageChooseView;

    .line 829
    .line 830
    iget-object v1, v1, Lcom/oplus/melody/heytranslation/language/LanguageChooseView;->a:Landroid/widget/TextView;

    .line 831
    .line 832
    if-eqz v1, :cond_349

    .line 833
    .line 834
    iget-object v2, v0, LAb/J;->b:Ljava/lang/Object;

    .line 835
    .line 836
    check-cast v2, LTe/l;

    .line 837
    .line 838
    invoke-interface {v2, v1}, LTe/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 839
    .line 840
    .line 841
    :goto_348
    return-void

    .line 842
    :cond_349
    const-string v1, "mFromLanguage"

    .line 843
    .line 844
    invoke-static {v1}, Lkotlin/jvm/internal/i;->j(Ljava/lang/String;)V

    .line 845
    .line 846
    .line 847
    throw v16

    .line 848
    :pswitch_34f
    move-object/from16 v3, p1

    .line 849
    .line 850
    iget-object v1, v0, LAb/J;->b:Ljava/lang/Object;

    .line 851
    .line 852
    check-cast v1, LBc/o$a;

    .line 853
    .line 854
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 855
    .line 856
    .line 857
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    .line 858
    .line 859
    .line 860
    move-result v2

    .line 861
    invoke-static {v2}, LMa/z;->a(I)Z

    .line 862
    .line 863
    .line 864
    move-result v2

    .line 865
    if-eqz v2, :cond_363

    .line 866
    .line 867
    goto :goto_3ca

    .line 868
    :cond_363
    iget-object v2, v0, LAb/J;->c:Ljava/lang/Object;

    .line 869
    .line 870
    check-cast v2, LBc/p;

    .line 871
    .line 872
    invoke-virtual {v2}, LBc/p;->getData()Lcom/oplus/melody/model/net/data/ZenModeInfoDO;

    .line 873
    .line 874
    .line 875
    move-result-object v4

    .line 876
    invoke-virtual {v4}, Lcom/oplus/melody/model/net/data/ZenModeInfoDO;->getResId()Ljava/lang/String;

    .line 877
    .line 878
    .line 879
    move-result-object v4

    .line 880
    iget-object v5, v1, LBc/o$a;->c:Ljava/util/concurrent/ConcurrentHashMap;

    .line 881
    .line 882
    invoke-virtual {v5, v4}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 883
    .line 884
    .line 885
    move-result v6

    .line 886
    const-string v7, "ZenModeSceneFragmentV2"

    .line 887
    .line 888
    if-eqz v6, :cond_390

    .line 889
    .line 890
    const-string v1, "onDownloadClick IGNORE "

    .line 891
    .line 892
    const-string v2, " progress="

    .line 893
    .line 894
    invoke-static {v1, v4, v2}, Lab/p;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 895
    .line 896
    .line 897
    move-result-object v1

    .line 898
    invoke-virtual {v5, v4}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 899
    .line 900
    .line 901
    move-result-object v2

    .line 902
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 903
    .line 904
    .line 905
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 906
    .line 907
    .line 908
    move-result-object v1

    .line 909
    invoke-static {v7, v1}, Lcom/oplus/melody/common/util/y;->y(Ljava/lang/String;Ljava/lang/String;)V

    .line 910
    .line 911
    .line 912
    goto :goto_3ca

    .line 913
    :cond_390
    new-instance v6, LBc/n;

    .line 914
    .line 915
    const/4 v8, 0x0

    .line 916
    invoke-direct {v6, v4, v8}, LBc/n;-><init>(Ljava/lang/String;I)V

    .line 917
    .line 918
    .line 919
    invoke-static {v7, v6}, Lcom/oplus/melody/common/util/y;->c(Ljava/lang/String;Ljava/util/function/Supplier;)V

    .line 920
    .line 921
    .line 922
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 923
    .line 924
    .line 925
    move-result-object v6

    .line 926
    invoke-virtual {v5, v4, v6}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 927
    .line 928
    .line 929
    invoke-virtual {v1}, LBc/o$a;->j()V

    .line 930
    .line 931
    .line 932
    new-instance v5, Ljava/lang/ref/WeakReference;

    .line 933
    .line 934
    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 935
    .line 936
    .line 937
    move-result-object v3

    .line 938
    invoke-direct {v5, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 939
    .line 940
    .line 941
    invoke-static {}, Lcom/oplus/melody/model/repository/zenmode/ZenModeRepository;->j()Lcom/oplus/melody/model/repository/zenmode/ZenModeRepository;

    .line 942
    .line 943
    .line 944
    move-result-object v3

    .line 945
    invoke-virtual {v2}, LBc/p;->getData()Lcom/oplus/melody/model/net/data/ZenModeInfoDO;

    .line 946
    .line 947
    .line 948
    move-result-object v2

    .line 949
    new-instance v6, LBc/o$a$b;

    .line 950
    .line 951
    invoke-direct {v6, v1, v5, v4}, LBc/o$a$b;-><init>(LBc/o$a;Ljava/lang/ref/WeakReference;Ljava/lang/String;)V

    .line 952
    .line 953
    .line 954
    const-string v7, "melody-model-zen2"

    .line 955
    .line 956
    invoke-virtual {v3, v2, v7, v6}, Lcom/oplus/melody/model/repository/zenmode/ZenModeRepository;->d(Lcom/oplus/melody/model/net/data/ZenModeInfoDO;Ljava/lang/String;Lcom/oplus/melody/model/repository/zenmode/d;)Ljava/util/concurrent/CompletableFuture;

    .line 957
    .line 958
    .line 959
    move-result-object v2

    .line 960
    new-instance v3, LBc/g;

    .line 961
    .line 962
    const/4 v6, 0x0

    .line 963
    invoke-direct {v3, v1, v4, v5, v6}, LBc/g;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 964
    .line 965
    .line 966
    sget-object v1, LU8/Q$c;->b:Landroidx/media3/session/p;

    .line 967
    .line 968
    invoke-virtual {v2, v3, v1}, Ljava/util/concurrent/CompletableFuture;->whenCompleteAsync(Ljava/util/function/BiConsumer;Ljava/util/concurrent/Executor;)Ljava/util/concurrent/CompletableFuture;

    .line 969
    .line 970
    .line 971
    :goto_3ca
    return-void

    .line 972
    :pswitch_3cb
    move v6, v4

    .line 973
    const/16 v16, 0x0

    .line 974
    .line 975
    iget-object v1, v0, LAb/J;->b:Ljava/lang/Object;

    .line 976
    .line 977
    check-cast v1, LAb/Z;

    .line 978
    .line 979
    iget-object v3, v1, LAb/Z;->q0:Landroidx/appcompat/app/g;

    .line 980
    .line 981
    if-eqz v3, :cond_43f

    .line 982
    .line 983
    iget-object v3, v0, LAb/J;->c:Ljava/lang/Object;

    .line 984
    .line 985
    check-cast v3, Lcom/coui/appcompat/edittext/COUIEditText;

    .line 986
    .line 987
    if-eqz v3, :cond_43a

    .line 988
    .line 989
    invoke-virtual {v3}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    .line 990
    .line 991
    .line 992
    move-result-object v4

    .line 993
    if-eqz v4, :cond_43a

    .line 994
    .line 995
    invoke-virtual {v3}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    .line 996
    .line 997
    .line 998
    move-result-object v3

    .line 999
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 1000
    .line 1001
    .line 1002
    move-result-object v3

    .line 1003
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 1004
    .line 1005
    .line 1006
    move-result-object v3

    .line 1007
    iget-object v4, v1, LAb/Z;->c0:Lta/b;

    .line 1008
    .line 1009
    if-eqz v4, :cond_43a

    .line 1010
    .line 1011
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1012
    .line 1013
    .line 1014
    move-result v4

    .line 1015
    if-nez v4, :cond_43a

    .line 1016
    .line 1017
    iget-object v4, v1, LAb/Z;->c0:Lta/b;

    .line 1018
    .line 1019
    invoke-virtual {v4}, Lta/b;->getEqId()I

    .line 1020
    .line 1021
    .line 1022
    move-result v4

    .line 1023
    iget-object v5, v1, LAb/Z;->d0:Ljava/util/List;

    .line 1024
    .line 1025
    if-eqz v5, :cond_410

    .line 1026
    .line 1027
    invoke-interface {v5}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    .line 1028
    .line 1029
    .line 1030
    move-result-object v5

    .line 1031
    new-instance v6, LAb/Q;

    .line 1032
    .line 1033
    invoke-direct {v6, v4, v3}, LAb/Q;-><init>(ILjava/lang/String;)V

    .line 1034
    .line 1035
    .line 1036
    invoke-interface {v5, v6}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 1037
    .line 1038
    .line 1039
    move-result v4

    .line 1040
    goto :goto_411

    .line 1041
    :cond_410
    move v4, v6

    .line 1042
    :goto_411
    if-eqz v4, :cond_41e

    .line 1043
    .line 1044
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/f;

    .line 1045
    .line 1046
    .line 1047
    move-result-object v1

    .line 1048
    const v2, 0x7f120793

    .line 1049
    .line 1050
    .line 1051
    invoke-static {v1, v2}, LX1/a;->G(Landroid/content/Context;I)V

    .line 1052
    .line 1053
    .line 1054
    goto :goto_443

    .line 1055
    :cond_41e
    iget-object v4, v1, LAb/Z;->c0:Lta/b;

    .line 1056
    .line 1057
    invoke-virtual {v4, v3}, Lta/b;->setName(Ljava/lang/String;)V

    .line 1058
    .line 1059
    .line 1060
    iget-object v4, v1, LAb/Z;->c0:Lta/b;

    .line 1061
    .line 1062
    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 1063
    .line 1064
    invoke-virtual {v3, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 1065
    .line 1066
    .line 1067
    move-result-object v3

    .line 1068
    array-length v3, v3

    .line 1069
    invoke-virtual {v4, v3}, Lta/b;->setNameLength(I)V

    .line 1070
    .line 1071
    .line 1072
    invoke-static {}, Lta/c;->e()Lta/c;

    .line 1073
    .line 1074
    .line 1075
    move-result-object v3

    .line 1076
    iget-object v4, v1, LAb/Z;->T:Ljava/lang/String;

    .line 1077
    .line 1078
    iget-object v5, v1, LAb/Z;->c0:Lta/b;

    .line 1079
    .line 1080
    invoke-virtual {v3, v2, v4, v5}, Lta/c;->i(ILjava/lang/String;Lta/b;)V

    .line 1081
    .line 1082
    .line 1083
    :cond_43a
    iget-object v2, v1, LAb/Z;->q0:Landroidx/appcompat/app/g;

    .line 1084
    .line 1085
    invoke-virtual {v2}, Landroidx/appcompat/app/p;->dismiss()V

    .line 1086
    .line 1087
    .line 1088
    :cond_43f
    move-object/from16 v2, v16

    .line 1089
    .line 1090
    iput-object v2, v1, LAb/Z;->c0:Lta/b;

    .line 1091
    .line 1092
    :goto_443
    return-void

    .line 1093
    :pswitch_data_444
    .packed-switch 0x0
        :pswitch_3cb
        :pswitch_34f
        :pswitch_32c
        :pswitch_2e1
        :pswitch_2cd
        :pswitch_18
    .end packed-switch

    .line 1094
    .line 1095
    .line 1096
    .line 1097
    .line 1098
    .line 1099
    .line 1100
    .line 1101
    .line 1102
    .line 1103
    .line 1104
    .line 1105
    .line 1106
    .line 1107
    .line 1108
    .line 1109
    :array_454
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
