# Documentation for flashing Corne v3
Follow: https://docs.qmk.fm/newbs_getting_started

```
cp -r ./custom_qwerty/ ~/Documents/corne/qmk_firmware/keyboards/crkbd/keymaps
cd ~/Documents/corne/qmk_firmware
qmk compile -kb crkbd -km custom_qwerty
```


Expose the right microcontroller

```
qmk flash -kb crkbd -km custom_qwerty
```

While that's listening, press the reset button on the right keyboard's microcontroller

That should flash successfully
