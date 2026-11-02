    public static String d(Context context, int i10, String str) {
        if (context == null) {
            return null;
        }
        switch (i10) {
            case 1:
                return ("OPPO Enco R".equals(str) || "OPPO Enco Air2".equals(str) || f(str) == 2) ? context.getString(R.string.melody_ui_equalizer_original) : context.getString(R.string.melody_ui_equalizer_classic);
            case 2:
                return ("OPPO Enco R".equals(str) || "OPPO Enco Air2".equals(str) || f(str) == 2) ? context.getString(R.string.melody_ui_equalizer_pulse_bass) : context.getString(R.string.melody_ui_equalizer_sub_woofer);
            case 3:
                return ("OPPO Enco R".equals(str) || "OPPO Enco Air2".equals(str) || f(str) == 2) ? context.getString(R.string.melody_ui_equalizer_melodious_voice) : context.getString(R.string.melody_ui_equalizer_clear_voice);
            case 4:
                return "OPPO Enco R".equals(str) ? context.getString(R.string.melody_ui_equalizer_soft_voice) : context.getString(R.string.melody_ui_equalizer_bright_transparent);
            case 5:
            case 35:
                return context.getString(R.string.melody_ui_equalizer_default);
            case 6:
            case 36:
                return context.getString(R.string.melody_ui_equalizer_dynaudio_simple_and_leisurely);
            case 7:
            case 37:
                return context.getString(R.string.melody_ui_equalizer_dynaudio_warm_and_gentle);
            case 8:
            case 38:
                return context.getString(R.string.melody_ui_equalizer_dynaudio_surging_and_hearty);
            case 9:
            case 39:
                return context.getString(R.string.melody_ui_equalizer_dynaudio_original);
            case 10:
                return context.getString(R.string.melody_ui_equalizer_jiu_shi_rang_new);
            case 11:
                return context.getString(R.string.melody_ui_equalizer_balanced);
            case 12:
                return context.getString(R.string.melody_ui_equalizer_bass_plus);
            case 13:
                return context.getString(R.string.melody_ui_equalizer_treble_plus);
            case 14:
                return context.getString(R.string.melody_ui_equalizer_pure_voice);
            case 15:
                return context.getString(R.string.melody_ui_equalizer_soft_voice);
            case 16:
                return context.getString(R.string.melody_ui_enco_x_classic);
            case 17:
                return context.getString(R.string.melody_ui_equalizer_balance);
            case 18:
                return context.getString(R.string.melody_ui_equalizer_reno_dawn);
            case 19:
                return context.getString(R.string.melody_ui_equalizer_hans);
            case 20:
                return context.getString(R.string.melody_ui_equalizer_natural_inspiration);
            case 21:
                return context.getString(R.string.melody_ui_equalizer_reno_sun);
            case 22:
                return context.getString(R.string.melody_ui_equalizer_original);
            case 23:
                return context.getString(R.string.melody_ui_equalizer_surging_and_hearty);
            case 24:
                return context.getString(R.string.melody_ui_equalizer_melodious_open);
            case 25:
                return context.getString(R.string.melody_ui_equalizer_reno_galaxy);
            case 26:
                return context.getString(R.string.melody_ui_equalizer_ultimate_sound);
            case 27:
                return context.getString(R.string.melody_ui_equalizer_hd_analyze);
            case 28:
                return context.getString(R.string.melody_ui_equalizer_pure_vocals);
            case 29:
                return context.getString(R.string.melody_ui_equalizer_powerful_bass);
            case 30:
                return context.getString(R.string.melody_ui_equalizer_dynaudio_special);
            case 31:
                return context.getString(R.string.melody_ui_equalizer_pulse_bass);
            case 32:
                return context.getString(R.string.melody_ui_equalizer_melodious_voice);
            case 33:
                return context.getString(R.string.melody_ui_equalizer_galaxy_monologue);
            case 34:
                return context.getString(R.string.melody_ui_equalizer_vitality);
            case 40:
                return context.getString(R.string.melody_ui_equalizer_dynaudio_vocals);
            case 41:
                return context.getString(R.string.melody_ui_equalizer_crisp_transparent);
            case 42:
                return context.getString(R.string.melody_ui_equalizer_dynaudio_original_sound);
            case 43:
                return context.getString(R.string.melody_ui_equalizer_dynaudio_hd_analyze);
            case 44:
                return context.getString(R.string.melody_ui_equalizer_dynaudio_bass);
            case 45:
                return context.getString(R.string.melody_ui_equalizer_dynaudio_classic);
            case 46:
                return context.getString(R.string.melody_ui_equalizer_clear_treble);
            default:
                return null;
        }
    }
