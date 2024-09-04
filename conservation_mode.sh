#!/bin/sh

if [ "$1" -eq 0 ]; then
    [ "$(acpi_call -p '\_SB.PCI0.LPC.EC.HKEY.BCSG' -i 1)" = "828" ] && echo 1 || echo 0
elif [ "$1" -eq 1 ]; then
    acpi_call -p '\_SB.PCI0.LPC.EC.HKEY.BCCS' -i 55
    acpi_call -p '\_SB.PCI0.LPC.EC.HKEY.BCSS' -i 60
elif [ "$1" -eq 2 ]; then
    acpi_call -p '\_SB.PCI0.LPC.EC.HKEY.BCCS' -i 95
    acpi_call -p '\_SB.PCI0.LPC.EC.HKEY.BCSS' -i 99
fi

