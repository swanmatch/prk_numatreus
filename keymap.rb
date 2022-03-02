# Initialize a Keyboard
kbd = Keyboard.new

r0 = 0
r1 = 1
r2 = 2
r3 = 3
r4 = 4
r5 = 5
r6 = 6
r7 = 7
r8 = 8
r9 = 9
r10 = 10
c1 = 11
c2 = 12
c3 = 13
c4 = 14

# Note that defferent from init_pins
kbd.init_matrix_pins(
  [
    [ [r0,c1], [r1,c1], [r2,c1], [r3,c1], [r4,c1],     nil,     nil, [r6,c1], [r7,c1], [r8,c1], [r9,c1], [r10,c1], ],
    [ [r0,c2], [r1,c2], [r2,c2], [r3,c2], [r4,c2],     nil,     nil, [r6,c2], [r7,c2], [r8,c2], [r9,c2], [r10,c2], ],
    [ [r0,c3], [r1,c3], [r2,c3], [r3,c3], [r4,c3],     nil,     nil, [r6,c3], [r7,c3], [r8,c3], [r9,c3], [r10,c3], ],
    [ [r0,c4], [r1,c4], [r2,c4], [r3,c4], [r4,c4], [r5,c4], [r5,c3], [r6,c4], [r7,c4], [r8,c4], [r9,c4], [r10,c4], ],
  ]
  )

# default layer should be added at first
kbd.add_layer :default, %i[
  KC_Q     KC_W    KC_E     KC_R   KC_T                          KC_Y    KC_U   KC_I      KC_O     KC_P
  KC_A     KC_S    KC_D     KC_F   KC_G                          KC_H    KC_J   KC_K      KC_L     KC_SCOLON
  KC_Z     KC_X    KC_C     KC_V   KC_B                          KC_N    KC_M   KC_COMMA  KC_DOT   KC_SLASH
  KC_LSFT  KC_TAB  KC_LCTL  LOWER  KC_SPACE  KC_BSPC    KC_LALT  KC_ENT  RAISE  KC_MINS   KC_QUOT  KC_EQL
]
kbd.add_layer :raise, %i[
  KC_1    KC_2    KC_3     KC_4     KC_5                         KC_6    KC_7     KC_8     KC_9         KC_0
  KC_F1   KC_F2   KC_F3    KC_F4    KC_F5,                       KC_F6   KC_F7    KC_F8    KC_F9        KC_F10
  KC_F11  KC_F12  KC_LPRN  KC_RPRN  KC_AMPR                      KC_GRV  KC_LBRC  KC_RBRC  KC_KP_SLASH  KC_BSLS
  KC_NO   KC_INS  KC_LGUI  KC_LSFT  KC_SPC   KC_BSPC    KC_LALT  KC_ENT  KC_NO    KC_DOT   KC_KP_MINUS  KC_EQL
]
kbd.add_layer :lower, %i[
  KC_EXLM  KC_AT     KC_HASH  KC_DLR   KC_PERC                      KC_CIRC  KC_AMPR  KC_ASTER    KC_LPRN  KC_RPRN
  KC_DEL   KC_ESC    KC_NO    KC_NO    KC_NO                        KC_PGDN  KC_PGUP  KC_PSCREEN  KC_NO    KC_NO
  KC_CAPS  KC_VOLU   KC_NO,   KC_ENT   RESET                        KC_NO    KC_NO    KC_NO       KC_UP    KC_NO
  KC_NO    KC_VOLD   KC_LGUI  KC_LSFT  KC_SPC  KC_BSPC    KC_LALT   KC_ENT   KC_NO    KC_LEFT     KC_DOWN  KC_RGHT
]

#                   Your custom     Keycode or             Keycode (only modifiers)      Release time      Re-push time
#                   key name        Array of Keycode       or Layer Symbol to be held    threshold(ms)     threshold(ms)
#                                   or Proc                or Proc which will run        to consider as    to consider as
#                                   when you click         while you keep press          `click the key`   `hold the key`
kbd.define_mode_key :RAISE,       [ :KC_NO,               :raise,                        150,              200 ]
kbd.define_mode_key :LOWER,       [ :KC_NO,               :lower,                        150,              200 ]

# `before_report` will work just right before reporting what keys are pushed to USB host.
# You can use it to hack data by adding an instance method to Keyboard class by yourself.
# ex) Use Keyboard#before_report filter if you want to input `":" w/o shift` and `";" w/ shift`
# kbd.before_report do
#   kbd.invert_sft if kbd.keys_include?(:KC_SCOLON)
#   # You'll be also able to write `invert_ctl` `invert_alt` and `invert_gui`
# end

# Initialize RGBLED with pin, underglow_size, backlight_size and is_rgbw.
# rgb = RGB.new(
#   0,    # pin number
#   0,    # size of underglow pixel
#   22,   # size of backlight pixel
#   false # 32bit data will be sent to a pixel if true while 24bit if false
# )
# Set an effect
#  `nil` or `:off` for turning off, `:breathing` for "color breathing", `:rainbow` for "rainbow snaking"
# rgb.effect = :rainbow
# Set an action when you input
#  `nil` or `:off` for turning off
# rgb.action = :thunder

# Append the feature. Will possibly be able to write `Keyboard#append(OLED.new)` in the future
# kbd.append rgb

kbd.start!