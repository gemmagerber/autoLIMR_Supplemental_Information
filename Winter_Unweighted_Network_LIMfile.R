! Unweighted Network
! Network LIM Declaration File
! Composed with autoLIMR
! Author: gemma
! Date: 2023-01-22

! Respiration included: Yes
! U included: Yes

! Living compartments: 4
! Non-living compartments: 0
! External compartments: 7
! Boundary flows: 11
! Internal flows: 7

! Abbreviations
! GPP = Gross Primary Production (Primary Producers only)
! Q = Consumption
! NPP = Net Primary Production (Primary Producers only)
! P = Production
! R = respiration
! U = Passive flows to non-living compartments/Unassimilated material
! AE = Assimilation Efficiency
! IM = Import flow
! EX = Export Flow
! NLNode = Non-living compartment

### COMPARTMENTS

Det = 7000.00
Invert = 800.00
Plant = 500.00
Vert = 200.00

### END COMPARTMENTS

### EXTERNALS

CO2
DetImport
InvertImport
PlantImport
DetExport
PlantExport
VertExport

### END EXTERNALS

### VARIABLES

! Consumption (Q) / Gross Primary Production (GPP) Variables

Det_Q = Flowto(Det) - Det_IM
Invert_Q = Flowto(Invert) - Invert_IM
Plant_GPP = Flowto(Plant) - Plant_IM
Vert_Q = Flowto(Vert)

! Production (P/NPP) Variables

Det_P = Flowfrom(Det) - Det_R - Det_U - Det_EX
Invert_P = Flowfrom(Invert) - Invert_R - Invert_U
Plant_NPP = Flowfrom(Plant) - Plant_R - Plant_U - Plant_EX
Vert_P = Flowfrom(Vert) - Vert_R - Vert_U - Vert_EX

! Unused Energy/Material (U) Variables

Det_U = Flowto(Det) - Det_P - Det_R - Det_EX
Invert_U = Flowto(Invert) - Invert_P - Invert_R
Plant_U = Flowto(Plant) - Plant_NPP - Plant_R - Plant_EX
Vert_U = Flowto(Vert) - Vert_P - Vert_R - Vert_EX

! Assimilation Efficiency (AE) Variables

Invert_AE = Invert_P + Invert_R
Vert_AE = Vert_P + Vert_R

### END VARIABLES

### FLOWS

! GPP flows

Plant_GPP: CO2 -> Plant

! Respiration flows

Det_R: Det -> CO2
Plant_R: Plant -> CO2
Invert_R: Invert -> CO2
Vert_R: Vert -> CO2

! Import flows

Det_IM: DetImport -> Det
Invert_IM: InvertImport -> Invert
Plant_IM: PlantImport -> Plant

! Export flows

Det_EX: Det -> DetExport
Plant_EX: Plant -> PlantExport
Vert_EX: Vert -> VertExport

! Adjacency Matrix flows

Det_Q_Invert: Det -> Invert
Det_Q_Vert: Det -> Vert
Invert_Q_Det: Invert -> Det
Invert_Q_Vert: Invert -> Vert
Plant_Q_Det: Plant -> Det
Plant_Q_Invert: Plant -> Invert
Vert_Q_Det: Vert -> Det

### END FLOWS

