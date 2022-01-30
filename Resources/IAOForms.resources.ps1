& { $BinaryFormatter = New-Object -TypeName System.Runtime.Serialization.Formatters.Binary.BinaryFormatter
@{
'$this.Icon' = New-Object -TypeName System.Drawing.Icon -ArgumentList @(New-Object -TypeName  System.IO.MemoryStream -ArgumentList @(,[System.Convert]::FromBase64String('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')));
}
}