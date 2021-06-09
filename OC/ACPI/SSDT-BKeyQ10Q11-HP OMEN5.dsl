// BrightKey for HP OMEN5
// In config ACPI, _Q10 to XQ10(HP OMEN5-down)
// Find:     5F 51 31 30
// Replace:  58 51 31 30

// In config ACPI, _Q11 to XQ11(HP OMEN5-up)
// Find:     5F 51 31 31
// Replace:  58 51 31 31
//
DefinitionBlock("", "SSDT", 2, "OCLT", "BrightFN", 0)
{
    External(_SB.PCI0.LPCB.PS2K, DeviceObj)
    External(_SB.PCI0.LPCB.EC0, DeviceObj)
    External(_SB.PCI0.LPCB.EC0.XQ10, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ11, MethodObj)
    
    Scope (_SB.PCI0.LPCB.EC0)
    {
        Method (_Q10, 0, NotSerialized)//down
        {
            If (_OSI ("Darwin"))
            {
                Notify(\_SB.PCI0.LPCB.PS2K, 0x0405)
                Notify(\_SB.PCI0.LPCB.PS2K, 0x20)
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.XQ10()
            }
        }
    
        Method (_Q11, 0, NotSerialized)//up
        {
            If (_OSI ("Darwin"))
            {
                Notify(\_SB.PCI0.LPCB.PS2K, 0x0406)
                Notify(\_SB.PCI0.LPCB.PS2K, 0x10)
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.XQ11()
            }
        }
    }
}
//EOF
