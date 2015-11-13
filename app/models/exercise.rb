class Exercise < ActiveRecord::Base
  belongs_to :user

  validates :bench,
    :deadlift,
    :squat,
    :overhead_press,
    :barbell_row,
    :tricep_extension,
    :barbell_curl,
    :cable_crunches,
    :calf_raise,
    :pullups,
    :bench_reps,
    :deadlift_reps,
    :squat_reps,
    :overhead_press_reps,
    :barbell_row_reps,
    :tricep_extension_reps,
    :barbell_curl_reps,
    :cable_crunches_reps,
    :calf_raise_reps,
    :pullup_reps,
    numericality: { greater_than_or_equal_to: 0 }

    KGS_TO_LBS = 2.2046

    def squat_max
      squat * (1 + 0.025 * squat_reps)
    end

    def deadlift_max
      deadlift * (1 + 0.025 * deadlift_reps)
    end

    def bench_max
      bench * (1 + 0.025 * bench_reps)
    end

    def overhead_press_max
      overhead_press * (1 + 0.025 * overhead_press_reps)
    end

    def barbell_row_max
      barbell_row * (1 + 0.025 * barbell_row_reps)
    end

    def squat_calc
      if user.gender == 'MALE'
        case user.weight * KGS_TO_LBS
        when 114..122
          {
            untrained: 78,
            novice: 144,
            intermediate: 174,
            advance: 240,
            elite: 320
          }
        when 123..131
          {
            untrained: 84,
            novice: 155,
            intermediate: 190,
            advance: 259,
            elite: 346
          }
        when 132..147
          {
            untrained: 91,
            novice: 168,
            intermediate: 205,
            advance: 278,
            elite: 369
          }
        when 148..164
          {
            untrained: 101,
            novice: 188,
            intermediate: 230,
            advance: 313,
            elite: 410
          }
        when 165..180
          {
            untrained: 110,
            novice: 204,
            intermediate: 250,
            advance: 342,
            elite: 445
          }
        when 181..197
          {
            untrained: 119,
            novice: 220,
            intermediate: 269,
            advance: 367,
            elite: 479
          }
        when 198..219
          {
            untrained: 125,
            novice: 232,
            intermediate: 285,
            advance: 387,
            elite: 504
          }
        when 220..241
          {
            untrained: 132,
            novice: 244,
            intermediate: 301,
            advance: 409,
            elite: 532
          }
        when 242..274
          {
            untrained: 137,
            novice: 255,
            intermediate: 311,
            advance: 423,
            elite: 551
          }
        when 275..318
          {
            untrained: 141,
            novice: 261,
            intermediate: 319,
            advance: 435,
            elite: 567
          }
        when 319..999
          {
            untrained: 147,
            novice: 272,
            intermediate: 332,
            advance: 454,
            elite: 593
          }
        end
      else
        case user.weight * KGS_TO_LBS
        when 97..104
          {
            untrained: 46,
            novice: 84,
            intermediate: 98,
            advance: 129,
            elite: 163
          }
        when 105..113
          {
            untrained: 49,
            novice: 91,
            intermediate: 106,
            advance: 140,
            elite: 174
          }
        when 114..122
          {
            untrained: 53,
            novice: 98,
            intermediate: 114,
            advance: 150,
            elite: 187
          }
        when 123..131
          {
            untrained: 56,
            novice: 103,
            intermediate: 121,
            advance: 160,
            elite: 199
          }
        when 132..147
          {
            untrained: 59,
            novice: 110,
            intermediate: 127,
            advance: 168,
            elite: 211
          }
        when 148..164
          {
            untrained: 65,
            novice: 121,
            intermediate: 141,
            advance: 185,
            elite: 232
          }
        when 165..180
          {
            untrained: 70,
            novice: 130,
            intermediate: 151,
            advance: 200,
            elite: 255
          }
        when 181..197
          {
            untrained: 75,
            novice: 139,
            intermediate: 164,
            advance: 215,
            elite: 268
          }
        when 198..999
          {
            untrained: 85,
            novice: 158,
            intermediate: 184,
            advance: 242,
            elite: 303
          }
        end
      end

    end

    def bench_calc

      if user.gender == 'MALE'
        case user.weight * KGS_TO_LBS
        when 114..122
          {
            untrained: 84,
            novice: 107,
            intermediate: 130,
            advance: 179,
            elite: 222
          }
        when 123..131
          {
            untrained: 91,
            novice: 116,
            intermediate: 142,
            advance: 194,
            elite: 242
          }
        when 132..147
          {
            untrained: 98,
            novice: 125,
            intermediate: 153,
            advance: 208,
            elite: 260
          }
        when 148..164
          {
            untrained: 109,
            novice: 140,
            intermediate: 172,
            advance: 234,
            elite: 291
          }
        when 165..180
          {
            untrained: 119,
            novice: 152,
            intermediate: 187,
            advance: 255,
            elite: 319
          }
        when 181..197
          {
            untrained: 128,
            novice: 164,
            intermediate: 201,
            advance: 275,
            elite: 343
          }
        when 198..219
          {
            untrained: 135,
            novice: 173,
            intermediate: 213,
            advance: 289,
            elite: 362
          }
        when 220..241
          {
            untrained: 142,
            novice: 183,
            intermediate: 225,
            advance: 306,
            elite: 381
          }
        when 242..274
          {
            untrained: 149,
            novice: 190,
            intermediate: 232,
            advance: 316,
            elite: 395
          }
        when 275..318
          {
            untrained: 153,
            novice: 196,
            intermediate: 239,
            advance: 325,
            elite: 407
          }
        when 319..999
          {
            untrained: 159,
            novice: 204,
            intermediate: 248,
            advance: 340,
            elite: 425
          }
        end
      else
        case user.weight * KGS_TO_LBS
        when 97..104
          {
            untrained: 49,
            novice: 63,
            intermediate: 73,
            advance: 94,
            elite: 116
          }
        when 105..113
          {
            untrained: 53,
            novice: 68,
            intermediate: 79,
            advance: 102,
            elite: 124
          }
        when 114..122
          {
            untrained: 57,
            novice: 73,
            intermediate: 85,
            advance: 109,
            elite: 133
          }
        when 123..131
          {
            untrained: 60,
            novice: 77,
            intermediate: 90,
            advance: 116,
            elite: 142
          }
        when 132..147
          {
            untrained: 64,
            novice: 82,
            intermediate: 95,
            advance: 122,
            elite: 150
          }
        when 148..164
          {
            untrained: 70,
            novice: 90,
            intermediate: 105,
            advance: 135,
            elite: 165
          }
        when 165..180
          {
            untrained: 76,
            novice: 97,
            intermediate: 113,
            advance: 146,
            elite: 183
          }
        when 181..197
          {
            untrained: 81,
            novice: 104,
            intermediate: 122,
            advance: 158,
            elite: 182
          }
        when 198..999
          {
            untrained: 92,
            novice: 118,
            intermediate: 137,
            advance: 177,
            elite: 217
          }
        end
      end
    end

    def deadlift_calc

      if user.gender == 'MALE'
        case user.weight * KGS_TO_LBS
        when 114..122
          {
            untrained: 97,
            novice: 179,
            intermediate: 204,
            advance: 299,
            elite: 387
          }
        when 123..131
          {
            untrained: 105,
            novice: 194,
            intermediate: 222,
            advance: 320,
            elite: 414
          }
        when 132..147
          {
            untrained: 113,
            novice: 209,
            intermediate: 239,
            advance: 342,
            elite: 438
          }
        when 148..164
          {
            untrained: 126,
            novice: 234,
            intermediate: 269,
            advance: 380,
            elite: 482
          }
        when 165..180
          {
            untrained: 137,
            novice: 254,
            intermediate: 293,
            advance: 411,
            elite: 518
          }
        when 181..197
          {
            untrained: 148,
            novice: 274,
            intermediate: 315,
            advance: 438,
            elite: 548
          }
        when 198..219
          {
            untrained: 156,
            novice: 289,
            intermediate: 333,
            advance: 457,
            elite: 567
          }
        when 220..241
          {
            untrained: 164,
            novice: 305,
            intermediate: 351,
            advance: 479,
            elite: 586
          }
        when 242..274
          {
            untrained: 172,
            novice: 318,
            intermediate: 363,
            advance: 490,
            elite: 596
          }
        when 275..318
          {
            untrained: 176,
            novice: 326,
            intermediate: 373,
            advance: 499,
            elite: 602
          }
        when 319..999
          {
            untrained: 183,
            novice: 340,
            intermediate: 388,
            advance: 512,
            elite: 617
          }
        end
      else
        case user.weight * KGS_TO_LBS
        when 97..104
          {
            untrained: 57,
            novice: 105,
            intermediate: 122,
            advance: 175,
            elite: 232
          }
        when 105..113
          {
            untrained: 61,
            novice: 114,
            intermediate: 132,
            advance: 189,
            elite: 242
          }
        when 114..122
          {
            untrained: 66,
            novice: 122,
            intermediate: 142,
            advance: 200,
            elite: 253
          }
        when 123..131
          {
            untrained: 70,
            novice: 129,
            intermediate: 151,
            advance: 211,
            elite: 263
          }
        when 132..147
          {
            untrained: 74,
            novice: 137,
            intermediate: 159,
            advance: 220,
            elite: 273
          }
        when 148..164
          {
            untrained: 81,
            novice: 151,
            intermediate: 176,
            advance: 241,
            elite: 295
          }
        when 165..180
          {
            untrained: 88,
            novice: 162,
            intermediate: 189,
            advance: 258,
            elite: 319
          }
        when 181..197
          {
            untrained: 94,
            novice: 174,
            intermediate: 204,
            advance: 273,
            elite: 329
          }
        when 198..999
          {
            untrained: 107,
            novice: 197,
            intermediate: 229,
            advance: 297,
            elite: 364
          }
        end
      end
    end

    def overhead_press_calc

      if user.gender == 'MALE'
        case user.weight * KGS_TO_LBS
        when 114..122
          {
            untrained: 53,
            novice: 72,
            intermediate: 90,
            advance: 107,
            elite: 129
          }
        when 123..131
          {
            untrained: 57,
            novice: 78,
            intermediate: 98,
            advance: 116,
            elite: 141
          }
        when 132..147
          {
            untrained: 61,
            novice: 84,
            intermediate: 105,
            advance: 125,
            elite: 151
          }
        when 148..164
          {
            untrained: 69,
            novice: 94,
            intermediate: 119,
            advance: 140,
            elite: 169
          }
        when 165..180
          {
            untrained: 75,
            novice: 102,
            intermediate: 129,
            advance: 153,
            elite: 186
          }
        when 181..197
          {
            untrained: 81,
            novice: 110,
            intermediate: 138,
            advance: 164,
            elite: 218
          }
        when 198..219
          {
            untrained: 85,
            novice: 116,
            intermediate: 146,
            advance: 173,
            elite: 234
          }
        when 220..241
          {
            untrained: 89,
            novice: 122,
            intermediate: 155,
            advance: 183,
            elite: 255
          }
        when 242..274
          {
            untrained: 93,
            novice: 127,
            intermediate: 159,
            advance: 189,
            elite: 264
          }
        when 275..318
          {
            untrained: 96,
            novice: 131,
            intermediate: 164,
            advance: 194,
            elite: 272
          }
        when 319..999
          {
            untrained: 100,
            novice: 136,
            intermediate: 171,
            advance: 203,
            elite: 284
          }
        end
      else
        case user.weight * KGS_TO_LBS
        when 97..104
          {
            untrained: 31,
            novice: 42,
            intermediate: 50,
            advance: 66,
            elite: 85
          }
        when 105..113
          {
            untrained: 33,
            novice: 46,
            intermediate: 53,
            advance: 71,
            elite: 91
          }
        when 114..122
          {
            untrained: 36,
            novice: 49,
            intermediate: 58,
            advance: 76,
            elite: 97
          }
        when 123..131
          {
            untrained: 38,
            novice: 52,
            intermediate: 61,
            advance: 81,
            elite: 104
          }
        when 132..147
          {
            untrained: 40,
            novice: 55,
            intermediate: 65,
            advance: 85,
            elite: 110
          }
        when 148..164
          {
            untrained: 44,
            novice: 60,
            intermediate: 72,
            advance: 94,
            elite: 121
          }
        when 165..180
          {
            untrained: 48,
            novice: 65,
            intermediate: 77,
            advance: 102,
            elite: 134
          }
        when 181..197
          {
            untrained: 51,
            novice: 70,
            intermediate: 83,
            advance: 110,
            elite: 140
          }
        when 198..999
          {
            untrained: 58,
            novice: 79,
            intermediate: 93,
            advance: 123,
            elite: 159
          }
        end
      end
    end

    def barbell_row_calc

      if user.gender == 'MALE'
        case user.weight * KGS_TO_LBS
        when 114..122
          {
            untrained: 53,
            novice: 90,
            intermediate: 129,
            advance: 167,
            elite: 205
          }
        when 123..131
          {
            untrained: 60,
            novice: 101,
            intermediate: 143,
            advance: 185,
            elite: 225
          }
        when 132..147
          {
            untrained: 67,
            novice: 111,
            intermediate: 156,
            advance: 201,
            elite: 245
          }
        when 148..164
          {
            untrained: 73,
            novice: 120,
            intermediate: 168,
            advance: 217,
            elite: 253
          }
        when 165..180
          {
            untrained: 78,
            novice: 128,
            intermediate: 180,
            advance: 232,
            elite: 281
          }
        when 181..197
          {
            untrained: 83,
            novice: 135,
            intermediate: 190,
            advance: 246,
            elite: 298
          }
        when 198..219
          {
            untrained: 87,
            novice: 142,
            intermediate: 201,
            advance: 259,
            elite: 314
          }
        when 220..241
          {
            untrained: 97,
            novice: 165,
            intermediate: 236,
            advance: 307,
            elite: 375
          }
        when 242..274
          {
            untrained: 100,
            novice: 174,
            intermediate: 252,
            advance: 329,
            elite: 403
          }
        when 275..318
          {
            untrained: 102,
            novice: 185,
            intermediate: 273,
            advance: 360,
            elite: 443
          }
        when 319..999
          {
            untrained: 101,
            novice: 197,
            intermediate: 297,
            advance: 397,
            elite: 493
          }
        end
      else
        case user.weight * KGS_TO_LBS
        when 97..104
          {
            untrained: 23,
            novice: 50,
            intermediate: 79,
            advance: 108,
            elite: 136
          }
        when 105..113
          {
            untrained: 24,
            novice: 52,
            intermediate: 82,
            advance: 112,
            elite: 141
          }
        when 114..122
          {
            untrained: 24,
            novice: 54,
            intermediate: 85,
            advance: 116,
            elite: 146
          }
        when 123..131
          {
            untrained: 25,
            novice: 56,
            intermediate: 88,
            advance: 120,
            elite: 151
          }
        when 132..147
          {
            untrained: 25,
            novice: 57,
            intermediate: 90,
            advance: 123,
            elite: 155
          }
        when 148..164
          {
            untrained: 25,
            novice: 59,
            intermediate: 94,
            advance: 130,
            elite: 164
          }
        when 165..180
          {
            untrained: 25,
            novice: 60,
            intermediate: 96,
            advance: 133,
            elite: 168
          }
        when 181..197
          {
            untrained: 25,
            novice: 61,
            intermediate: 98,
            advance: 136,
            elite: 172
          }
        when 198..999
          {
            untrained: 24,
            novice: 61,
            intermediate: 100,
            advance: 139,
            elite: 176
          }
        end
      end
    end

end
