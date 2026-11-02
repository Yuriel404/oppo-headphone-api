    public static int d(int i10) {
        if (i10 == 11) {
            return 4;
        }
        if (i10 == 22) {
            return 6;
        }
        switch (i10) {
            case 16:
                return 1;
            case 17:
                return 2;
            case 18:
                return 3;
            case 19:
            case 20:
                return 4;
            default:
                switch (i10) {
                    case 26:
                    case 29:
                    case 33:
                    case 36:
                        return 2;
                    case 27:
                        return 4;
                    case 28:
                    case 32:
                        return 1;
                    case 30:
                    case 34:
                        return 3;
                    case 31:
                    case 35:
                        return 6;
                    default:
                        return i10;
                }
        }
    }
