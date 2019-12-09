//
//  InputDay6.swift
//  Advent Of Code 2019
//
//  Created by Konrad Winkler on 12/8/19.
//  Copyright © 2019 konwinkler. All rights reserved.
//

import Foundation

class InputDay6 {
    
    func get() ->[String] {
        return raw.split(separator: "\n").map({
            String($0)
        })
    }
    
    let raw = """
MB5)V1S
VYJ)JRF
SLW)9YR
CPL)8KQ
Q5P)H7W
TJT)139
PYD)XMX
4S5)K2V
RWW)JTL
HNC)81N
64N)V96
RRM)FXW
Y8R)1C1
VL8)M6N
G7L)RQJ
5C3)SC4
JZL)DGX
C7B)KSS
2X5)5YY
W91)5R1
KP8)QYY
NCL)5WX
HN9)4LZ
4Z6)15F
LHJ)B7D
S3S)J8Z
ZCW)KC1
3TJ)2RP
J9F)SXH
SHX)WH9
M4M)6NK
23F)Q7S
B7Y)ZM5
M7H)D8G
N8F)K1F
5PV)SXD
HGX)5BM
LH8)C2L
XFM)ZHM
H1L)XYG
4VH)W46
2Q8)6V5
G41)LNT
GNY)Y8R
95L)MJC
FPR)X8M
MS4)YL4
B8B)YL6
6N4)SWY
B65)X7B
N15)C89
LX4)TBZ
3W2)JRH
MVN)34C
XMX)DW8
221)5CM
QPP)14R
SRB)7SK
3P9)MKR
DGX)6FT
GQG)T3J
JS4)XTJ
9MQ)FKR
B29)PWB
XHC)NX1
55D)YCV
CV2)3FH
QN1)MFX
P2B)B51
Z4D)Z2S
3MZ)GYC
LCQ)FF9
VPZ)CV2
Z4D)K9P
9F2)CV6
NJS)HRR
W7Z)6CL
7NL)M9M
LJG)426
6LP)24X
YQ7)CXX
4RB)BKC
KNW)2X5
KCY)4D2
2GC)GV9
YWN)DWL
JML)131
JHR)3G4
KBM)BMX
GWB)S1P
LMW)2LL
DS7)8X3
8KT)ZCW
MHT)9XZ
MV8)B7Y
VPB)KT8
6RQ)87P
RP6)7QR
KQP)PXT
GBG)LCQ
CLY)RVF
64S)VP8
FR9)K5X
K37)QJK
9ZB)MS1
V6C)CXT
SC2)VJS
B45)9KK
ZH9)VWY
R17)XLS
N5Z)KWV
QWH)HY7
2LL)79J
1DF)RT5
MGH)XD4
VZ3)9YW
413)17F
YL4)15X
ZJB)SHX
HGF)VN7
4TW)TGX
3N4)SDF
KLJ)2FR
J5R)JZL
B59)WW6
KRX)JGM
N75)78C
T4B)H2H
2VB)JG3
7MG)4N2
C7M)2BK
MKR)LBF
KFX)6KG
48T)844
H1W)9XX
TGX)PN7
GGK)22B
M8N)GNY
L6R)WVW
VRY)B15
9YR)6RQ
QQ6)1KB
R22)STY
KC1)6RW
Q5Z)849
XWK)VFW
GFD)C8Z
L5D)J2Y
74R)3TJ
D94)3P9
JRH)HKV
3DZ)CFH
WKN)44S
JJC)9MQ
VKT)VBW
KT8)M7P
NH8)FDG
F7N)7MG
6RQ)RQM
V4T)ZN8
25C)2L3
WJW)DG9
N5X)SRB
QZK)GLJ
WG4)K56
844)J3V
HGX)KMR
87P)HKX
MK1)WTY
PC3)4TR
LG8)B29
SDR)FWN
9ZM)SVT
3K3)XJ6
WV1)G41
NKV)36R
WFG)4M1
WVW)1TQ
NQD)WF1
B9Q)3YV
CTP)VZB
72S)NSM
755)X7S
MB2)JWB
GD8)HGX
3FH)Q1H
P8P)TD2
8XK)KP8
1B4)7LK
3WC)LXK
YZP)QZK
C72)1M6
VZB)LZV
TC6)4RB
DH6)LJG
6XL)SKB
G52)3MZ
THK)F8F
S1P)NJK
QPG)5NF
9J8)W5V
6CJ)BY3
F8F)L4S
L7X)4P2
9NQ)RWW
V4V)BSC
YJW)G7F
3CK)GMH
VYR)LRM
XXP)JML
Z1S)3QH
3SH)YBF
WTY)QR4
FZ2)BMB
JZ5)Z5Q
HDZ)2V9
CTK)HRP
VWY)9HX
YNN)Z5F
N97)P1K
8NJ)JBK
VF7)JD2
4GG)KC6
8KS)YJ6
DH2)HXL
HB3)1HK
K56)DFB
4H6)K6Y
M7P)3WC
DG9)88R
VRB)Y2X
NMZ)RRS
T3J)NQ6
KYZ)KYX
TNN)48T
SG7)83G
JCK)QFN
5HH)1B4
16R)C4S
CQJ)KCS
6PH)2W6
89Q)7SB
NNK)L9J
77G)KTN
S2C)YOU
KFK)57L
LJ5)1BV
CCB)XQ8
14R)T7Y
3W2)TYQ
KNC)KF6
TW1)N5Z
ZCQ)8NJ
89G)5XD
Z15)SMZ
R5C)VMJ
CTJ)QWH
5NF)G52
24X)SBP
Z4K)HN9
6KG)BLM
66N)152
CCX)TTM
P1X)3CM
Q7Q)KYZ
VFL)LX4
SCT)KJ7
5VK)R8D
MKH)RZ4
H2H)WKN
6V5)9TW
W4G)QLS
LZV)D82
RHL)CLG
QG8)LX2
7S1)B7T
BY3)CMC
HBP)RD7
9PR)FVP
72J)Y14
PMM)8ZV
MZ8)MFN
3GD)8Y5
ZJ3)WJW
5HZ)X2V
FYZ)G5R
WMR)WT8
HNZ)6GW
9XX)33J
6QS)58X
11L)VWW
4LZ)MQT
MQT)PYS
BM6)YRP
658)LG8
NGZ)1VD
HRK)ZVG
RZG)RPJ
83G)B7B
JG3)BLQ
2SG)MQ4
B6C)4V6
GLJ)ST5
7MQ)P9X
3Y9)1ZB
K9P)D9Y
CJ8)LM6
KCY)VYJ
GVY)18R
SZG)QCX
15F)S5F
35W)YST
9NQ)BYJ
VGX)8LH
WQM)2HT
QR4)ZLF
SWY)HWK
P9X)HY6
LGH)ZJ4
GYC)NGZ
81F)P4T
9BF)CTF
5Q1)1RC
6MR)3X6
9HX)X83
DBQ)C9D
1KP)9F2
J8Z)JCK
Z5R)S2Z
B7B)KRX
ZM5)1YF
H2N)G5C
FSR)9ZM
3YV)74R
93T)MCN
5HK)MVS
V22)4Z6
RSG)N15
YDJ)F9N
K6Y)RSZ
3CM)169
F2L)39W
CK4)842
G6Q)S1W
D3H)55D
842)YCL
NXQ)L67
KG8)NDS
LGD)2QJ
MFX)JLD
1KB)Z4D
RMW)CWB
LC2)QC1
Q36)HTW
SG7)CJX
9BH)N34
85F)YNF
LVD)9BH
7GL)KNC
SDF)C1Z
68R)WQC
BPW)N8F
3G4)71T
JFJ)CR2
YFD)6CJ
Q8N)XMD
2CV)X3M
NPZ)89Q
SSK)9TP
QC1)VPZ
CML)9MV
4NC)GVY
T26)9NQ
8Y5)TDB
TTM)9PR
7ZY)3XT
MQL)PXS
LXK)2SG
FWP)LBD
CSY)C72
FYQ)B2F
VYJ)SX8
ZHV)6QS
KKB)1ZM
XRN)6XL
VN4)6XV
KWV)KW5
SBP)971
BMX)FXV
7K4)L65
7XV)791
DW8)RSK
9XZ)5CD
KG8)5C3
LBD)WZ3
7DC)T4B
1J7)XN9
KF6)GJR
TPV)FR9
B7T)89F
F94)KLB
3CV)49V
PN7)J89
CLY)F2P
71Z)YZP
HRR)X9Z
1SF)QQ6
MKR)5P3
XLB)G3P
3XT)6FC
WSC)TR9
1SF)8JZ
YMK)7T6
YLW)Q9Y
LQC)FSX
971)9LV
PL3)MMV
78C)Q72
NS8)W6M
RPW)5YW
91Q)QKC
B9B)7Q4
Q3J)B2D
2ZP)YMK
MSS)RP6
N6H)X4V
5P3)PHS
7LP)VXP
FJT)251
N9G)N71
21W)XRJ
FFT)Z22
89F)VRY
45S)MZ8
8J5)98X
4YF)HCN
3X6)WFG
R8D)THY
YNS)KT3
2TZ)W6V
MFN)P6B
1HK)WSV
PXS)YQ7
7LJ)PKH
QHG)4TW
G16)7QV
CXX)GL5
KDN)NNT
TPS)JZ3
X7B)RSG
6B1)JKD
CLG)ZGY
WQC)QTP
MYZ)3N4
Y8R)KMW
YL6)45S
H25)459
9TW)M3N
HDF)SLJ
LX2)5V6
6SD)2ZC
KGQ)XWK
85H)7ZV
459)XGH
VWW)M4M
27C)CTP
RKV)FSR
Z5K)9L1
2P1)6N1
WZ3)D94
TF1)CV3
1YF)T3S
F87)N9D
H7Z)QPP
NDS)GP1
GLN)R5Q
BHV)XRN
4T5)658
QRF)HW8
Q66)WWZ
2Q6)DWD
7T6)L9V
RVF)MXJ
RZ4)WQM
V9T)SR2
M21)CTK
ZDW)QP4
WF1)VRB
VXR)KFX
NHR)HDF
11P)TG5
K2V)YGJ
NH3)V76
VNQ)WY7
G8P)8YY
W5C)RZG
W46)T73
C89)N5X
2V9)5FQ
P5K)NCL
DNK)98T
FLX)MB5
VXG)R17
YQ7)Q36
L67)K62
74G)28S
X9H)L6R
JRH)CJ6
LBJ)JHR
SX8)TF1
RD7)3P3
H4X)KPW
J33)BWF
R4G)VXR
XRJ)Y25
Q7Q)GD8
2SG)P1X
4CB)66N
VYW)FF1
YB6)CL1
4QG)TX6
PKH)FYQ
JPG)LL9
M8W)RGV
XF9)NNK
COM)Q1M
SMZ)DS7
DNP)68R
1V4)4KY
GDN)NHR
8D1)HCL
KC6)HGF
CPS)VFL
33K)XQZ
Y14)RJ6
H3F)77G
NMG)F7N
FWN)3GD
36R)MZ3
MG8)VGX
6CL)352
JM4)FRB
43X)RNH
TBW)F8R
JCZ)V22
11Q)W7Z
N1L)RVD
Q6V)DNP
BWF)Y9G
H8D)D13
F8R)4QR
J1X)8X4
XFJ)N35
QTP)869
G3P)11Q
K9L)QYX
KN6)XHC
MWF)G6Q
KTN)SYM
XGH)8MN
QPP)W52
G2Y)FBZ
WBX)ZQ4
4F7)7XV
152)KGQ
CJX)L5D
JZ3)4ZT
CCB)N9G
HK7)K4Q
JGH)MGH
VN7)PH4
M9Z)S9V
SK8)PYD
3V9)G45
ZN8)4QG
2Q6)HLM
D13)LYH
ZQ4)D6G
SVT)SDR
PFK)QZ4
CXT)X31
44S)5GB
1RC)PKD
LWT)G7L
RX1)VRQ
P31)WYC
47S)NMG
C1Z)YY5
HWK)GGK
JC5)1GW
HVX)395
W6M)VF7
JTL)4GD
G5C)7BN
PQL)GMS
NXQ)45D
S5S)HNZ
C12)K2D
7P9)282
QF5)3W2
WH4)9VJ
YNF)M8W
5V6)DX7
XQZ)7D2
XTJ)HM5
HTR)9H5
HYN)71Z
7Q4)TF3
WH9)GF2
1CG)Q5Z
5GB)S3S
WFF)DJT
N4C)5BJ
32D)XB5
KLB)SC2
15X)1C3
GDT)W3X
1GW)CKZ
GGJ)4W8
5BJ)H7Z
PPT)7S1
FY4)SCM
395)3K3
HFT)K98
2RP)LZ4
49V)4LH
F2T)GCL
DJR)VTW
QW3)M8N
LYH)VYW
6N1)4YF
N34)VKT
1KB)YFD
3YB)ZB6
RSZ)F2T
2FR)1V4
MDJ)Z4K
K62)TW1
J3V)NHJ
JML)GT8
6RW)8CP
8ZV)9BF
XXP)NMZ
K4Q)T36
L4S)22G
953)XFM
ZGY)HTR
RJ6)4H6
HRP)TQD
NNT)5YP
L65)1H8
KXB)8YB
T5D)P5K
LJY)VTL
SCS)HJ7
35S)2RZ
NX1)THK
HY7)36Z
FXV)369
RSK)4Z2
2Y8)F9B
NNW)KG7
WSV)78N
MMV)5GL
JLD)WSC
PZH)N7G
LL9)4Y4
1BV)BG2
XMD)NT6
H9D)XF9
MNV)W8J
SX8)V3N
P8Y)CW1
T73)3F9
D82)32Z
XPH)PLM
352)NL6
Z94)D43
NK7)7QT
N35)KHR
NM1)MG8
8JZ)TJT
923)G3N
MVS)7DH
YMK)HVQ
JM4)74G
HJ7)RPW
9CY)C7M
V76)4GG
LNT)Y2J
8WD)YNN
41X)GKF
TD2)FZ2
T6H)4TQ
NHB)NKV
TV3)RRM
VRM)LVD
QNZ)FJT
3KZ)P8P
XJ6)3Y9
4D5)YSS
WB3)TV3
1Y6)Q3J
98T)6WH
SLT)KQL
951)5N8
9ZB)Z6X
KKD)M4B
YGJ)4F1
KBV)PQL
G45)M7H
8CP)J9F
BLQ)2P1
XS6)NXQ
BZ9)XQK
YLN)D1R
55T)XQB
N7H)RFF
FTM)93T
LJ5)MZ9
3YB)BFP
X9Z)7K7
W8J)9BC
43X)NM1
G5R)JGH
7SK)HRK
3BL)SWS
N38)QL4
HKV)64S
SDF)W33
D94)HB3
GWW)8DQ
3QH)WFF
SLJ)2Y4
3TJ)NQT
1C3)KLJ
954)VL8
LW2)Z6D
2F1)RQ5
C1Z)XM7
3CV)5HH
QCK)QHS
XKD)2XP
24J)221
8KS)MF3
5YY)DJQ
KBH)1W7
XYG)XHV
XMW)BTK
B2D)5T2
2W6)DH6
W2R)CK4
FY4)9RH
WF1)L7G
6GW)LBJ
QCX)H25
XHV)3DZ
5Z7)N9H
RYD)H27
QVD)ZJ3
CM1)NHB
W8J)8KH
C5D)WV1
CV3)25C
953)741
9MV)ZCQ
WYC)SLW
6WH)387
FXW)1G1
Z1S)212
MS1)FYZ
W33)F78
NQT)72G
2XP)1MG
J9J)KBS
C1R)RHL
L7G)R4G
HWK)CCX
TNP)1SF
5R1)SLT
B51)VDS
FBK)LH2
387)XXP
4NX)RDL
FF9)XW7
D3P)5R5
M3N)YWW
2Q8)9FM
8YY)1J7
Z6X)3CV
9HX)FV8
8MN)S2C
XD4)5HK
ST7)B59
LR2)PF2
23Y)FTM
7D2)F2H
9JG)TG9
2QJ)H4J
HM5)CSY
DH5)55T
GFL)WBX
HGF)SK8
PXT)SCT
K2D)7J8
78K)MDJ
2XT)MP2
4QR)549
DFB)DRV
6NK)Q7Q
5BM)2Y8
9XZ)DT2
M25)MV8
2BK)3V9
28S)W2R
RPJ)X37
QLS)9XF
X83)XFJ
8X4)ZHV
KMR)KDN
2K2)4T5
LRM)MWF
JGM)4D5
4LH)PZH
L4X)H2N
HHH)C12
R4G)GWB
ZVP)F22
YBF)H37
RSY)PD7
K3W)VXG
K9G)HN8
1C1)QCK
YTK)JZ5
KQL)NLZ
PLM)H7X
PYS)GDT
TY2)VRM
FF9)SZY
SXH)SZG
2HT)P19
JTQ)B5F
B9B)F2L
5CM)CPS
L5D)GQG
K1F)QNZ
7QT)LJY
9KK)1DF
XN9)KBV
9VJ)SG7
M4B)ZDW
6XV)MQL
1VL)Z94
KSS)H8D
STY)JFJ
PXR)K3W
X3M)35W
RNH)FWP
2RZ)LW4
HVQ)QG8
8VS)QZS
M8T)4YM
GJR)SBJ
N9D)WH3
4TQ)VZ3
GG6)6MY
4TR)M21
XLS)6QC
MZ3)YWS
ZRG)HK7
V1S)ZRG
CR2)V8R
81N)PJX
VXP)LMZ
849)LTC
DWD)LQC
1H8)3FT
D2T)KG8
BYJ)5Q1
3H6)5X1
8KQ)CHK
T7Y)J1X
4GD)KQP
XM7)QF5
9RH)JZR
GKF)DBQ
THY)JHZ
5XD)2GC
MV8)HBP
CW1)W91
411)923
RRS)8XK
C66)TNP
BMX)J5R
FKR)5Z7
MRV)PFK
9BC)59G
GVY)GDN
HH8)DRK
V96)6B1
SKB)KFK
DJQ)23Y
PF2)2HD
2Y4)D3F
K86)K1P
YRP)GBG
V8R)W4G
F9N)GP8
XQB)BPW
CSY)C66
NHJ)D2T
GGF)MK1
4NX)V6C
JYC)YNS
GMS)KNG
XW7)MRV
RFS)Q2C
7NL)WH4
TBZ)FLX
RQ5)ZJB
FPX)WL3
BMB)K86
N7G)WC7
T3S)NQD
KG7)GLN
741)CPL
S1W)G8P
W5V)ZJJ
JRF)X8V
TX6)PK9
89Q)DFS
W6V)9FW
D8G)NVJ
VBW)3SH
VTW)RYD
5CM)QVD
9TP)LC2
NCD)4VH
HLM)11L
6MY)S68
S2Z)V3R
BFP)954
Z5R)YB6
SBP)2Q8
JWQ)TQK
F2T)VPB
SZY)PXR
ML1)ZH9
LM6)LH8
CV6)69H
77Y)G2Y
22B)JYC
4Z2)1G9
5N8)755
GCL)Q5P
4ZT)M8T
Z6H)RKV
ML1)M9B
4YM)LFL
9JG)LMW
3FT)2XT
RQM)B6C
DRV)1Y6
B1P)3YB
PGR)YDJ
9L1)RWV
79J)41X
GF8)YTK
N15)4S7
8MC)1VL
4F7)77Y
SYM)YHV
4P2)2PZ
426)2TZ
H7X)K37
17F)71V
9G9)PKR
KC2)N38
L4X)WB3
1TQ)G6B
YSS)SCS
Q1M)WW8
819)2CV
Q2C)B65
169)7P9
139)7DC
D43)LR2
KJ7)HH8
C4S)MHT
5G8)HDZ
QTK)J33
F2H)YBQ
5YP)YWN
W52)1SL
32Z)CM1
LZ4)2F1
7SB)QPG
7K7)SSY
CW1)9DN
YCL)LW2
CTF)N97
FV8)8KS
KQP)R1M
6QC)P2B
LW4)64N
R17)FQN
71V)4CB
X31)8VS
5FQ)9ZB
7J8)D8T
WZ3)KKB
VDS)WLZ
WT8)J9J
BKC)PC3
T4B)9G9
NT6)ST7
LH2)JCZ
QHS)RMW
9LV)PLL
16M)H1L
HCN)PMM
J69)8KT
35S)7JW
5C3)F6S
J89)LJ5
FVP)LHJ
RT5)XS6
LBF)QW3
8YB)GGF
ZHM)5HZ
W3X)MGQ
KHR)G16
HY6)DNW
CMC)VPJ
Q72)JMG
WW8)Z6H
Y25)72S
3MZ)53C
791)951
KPW)S5S
NQ6)QRF
NCL)VYR
1VD)85F
QYX)413
NJK)D3H
N74)MNV
MP2)F87
4F1)FQH
JZR)WMR
DNW)TNN
YZP)NH3
H27)FY4
28S)6R8
DRK)B9B
NTG)1FY
GL5)HVX
G3N)CML
CPS)PQN
R1M)TY2
C8Z)MS4
N71)ML1
5NF)GF8
SCM)CCB
BG2)9JG
ZVG)6SD
FBZ)BZ9
L9V)7ZY
7DH)B8B
1JT)DNK
QL4)NS8
7LK)35S
QKC)SAN
Q1H)DJR
4N2)C1R
SC4)R22
413)WG4
SXD)K9L
9CY)4S5
58X)NCD
VTL)LGH
V96)P31
KYH)CLY
LTC)MB2
D9Y)JM4
53C)F94
PD7)7MQ
5GL)6XW
6FT)H4X
RQJ)TC6
WH3)2VB
M6N)H66
369)N74
TF3)JC5
FGL)NTG
P6B)1JT
MDJ)V9T
6CL)754
V3N)2Q6
5YW)KCY
VRY)24J
2HD)47S
WL3)3YH
1SL)CTJ
QZ4)697
S68)KYH
KBS)FPR
DT2)H9D
CHK)Y3R
Y2X)L7X
9VJ)3CK
BLM)CQJ
PLL)81F
RFF)5VK
V3R)LWT
FQN)M25
9H5)KHG
KTN)4NX
QZS)23F
H7W)MKH
PKD)33K
F2P)MVN
G6B)GZ6
8LH)PGR
NLZ)78K
GFD)XPH
LFL)N7H
D8T)7Z1
X4V)R2D
D1R)Q6V
JV2)DH5
WLZ)411
352)C7B
T36)QWS
5R5)Q66
HKX)KC2
QL9)32D
M5Q)T6H
88R)M5Q
MF3)B1P
9YW)BM6
Y9G)VNQ
M9B)7GL
57L)YLN
HTW)PL3
1ZM)JWQ
1W7)FFT
SR2)YJW
BTK)XKD
P19)RSY
BSC)7LJ
212)NR2
LX4)K39
HXL)Z5R
FSX)W3T
HN8)FGL
KFK)27C
WN2)M9Z
F9B)GFL
WY7)Z15
GQL)21W
BZ9)KNW
MFS)9CY
GV9)NQN
V8T)91Q
D7X)GFD
4KY)Q8N
9NX)MFS
YB6)NK7
Q9Y)1KP
KCS)B45
M4B)GG6
ZVP)2K2
CWB)N3S
HVX)JTQ
59G)TTC
YMV)B9Q
16M)XLB
PJX)VN4
69H)11P
LMK)X9H
F6S)J69
R2D)5SJ
X37)17P
3CL)YMV
ST5)N4C
2L3)NH8
3F9)HNC
C2L)HFT
7QP)ZRM
C12)KN6
1V9)PPT
XB5)8J5
DJT)3BL
HKV)16M
YJ6)KBM
TX6)R5C
B15)LMK
549)JPG
K2V)NJS
FRB)1CG
MJC)4NC
TTC)H1W
KT3)CJ8
NR2)85H
131)3KZ
X8V)953
21W)W5C
3YH)8MC
VFW)7K4
D79)KXB
G7F)JJC
4M1)7NL
S9V)NPZ
VP8)K9G
KNG)HHH
D3F)T5D
SWS)3CL
TYQ)9NX
78N)N1L
RDL)819
X2V)L4X
8Y2)GQL
VRQ)FBK
1M6)QN1
MXJ)7LP
1MG)GTF
YY5)H3F
S5F)BHV
PHS)95L
6XW)72J
DFS)D7X
YWS)SSK
B1P)DH2
K98)FPX
Z5F)6N4
9DN)78H
W3T)JS4
7Z1)5G8
49V)9J8
Z6D)GGJ
V9T)MYZ
SC4)YLW
NQN)WN2
MFN)TBW
KRX)LGD
9FW)V8T
8X3)V4T
4S7)XMW
Y2J)5PV
QYY)T26
GMH)JV2
H98)Q2Y
MZ9)2ZP
ZRM)KBH
251)Z5K
KHG)HYN
5WX)P8Y
71T)N75
H37)6PH
HCL)D3P
M25)16R
K39)QL9
WWZ)8Y2
PK9)N6H
LMZ)ZVP
Z5Q)H98
JKD)WK2
JHZ)43X
PQN)NNW
J2Y)3H6
YWW)GWW
NL6)KKD
XQ8)TPS
RWV)8D1
TDB)RX1
2PZ)6MR
NSM)QTK
GP1)TPV
ZB6)1V9
QHG)4F7
18R)D79
ZJJ)Z1S
45D)7QP
7QV)X42
M9M)MSS
TQK)V4V
Q7S)23K
TG9)C5D
VMJ)89G
7QR)SPB
RGV)QHG
3P3)RFS
GT8)6LP
P1K)8WD
"""
    
}
