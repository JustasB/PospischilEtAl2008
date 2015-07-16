TITLE Mod file for component: Component(id=Na_CML type=ionChannelHH)

COMMENT

    This NEURON file has been generated by org.neuroml.export (see https://github.com/NeuroML/org.neuroml.export)
         org.neuroml.export  v1.4.2
         org.neuroml.model   v1.4.2
         jLEMS               v0.9.7.3

ENDCOMMENT

NEURON {
    SUFFIX Na_CML
    USEION na WRITE ina VALENCE 1 ? Assuming valence = 1; TODO check this!!
    
    RANGE gion                           
    RANGE gmax                              : Will be changed when ion channel mechanism placed on cell!
    RANGE conductance                       : parameter
    
    RANGE g                                 : exposure
    
    RANGE fopen                             : exposure
    RANGE m_instances                       : parameter
    
    RANGE m_alpha                           : exposure
    
    RANGE m_beta                            : exposure
    
    RANGE m_tau                             : exposure
    
    RANGE m_inf                             : exposure
    
    RANGE m_rateScale                       : exposure
    
    RANGE m_fcond                           : exposure
    RANGE m_forwardRate_TIME_SCALE          : parameter
    RANGE m_forwardRate_VOLT_SCALE          : parameter
    RANGE m_forwardRate_VT                  : parameter
    
    RANGE m_forwardRate_r                   : exposure
    RANGE m_reverseRate_TIME_SCALE          : parameter
    RANGE m_reverseRate_VOLT_SCALE          : parameter
    RANGE m_reverseRate_VT                  : parameter
    
    RANGE m_reverseRate_r                   : exposure
    RANGE h_instances                       : parameter
    
    RANGE h_alpha                           : exposure
    
    RANGE h_beta                            : exposure
    
    RANGE h_tau                             : exposure
    
    RANGE h_inf                             : exposure
    
    RANGE h_rateScale                       : exposure
    
    RANGE h_fcond                           : exposure
    RANGE h_forwardRate_TIME_SCALE          : parameter
    RANGE h_forwardRate_VOLT_SCALE          : parameter
    RANGE h_forwardRate_VT                  : parameter
    
    RANGE h_forwardRate_r                   : exposure
    RANGE h_reverseRate_TIME_SCALE          : parameter
    RANGE h_reverseRate_VOLT_SCALE          : parameter
    RANGE h_reverseRate_VT                  : parameter
    
    RANGE h_reverseRate_r                   : exposure
    RANGE m_forwardRate_V                   : derived variable
    RANGE m_reverseRate_V                   : derived variable
    RANGE h_forwardRate_V                   : derived variable
    RANGE h_reverseRate_V                   : derived variable
    RANGE conductanceScale                  : derived variable
    RANGE fopenHHrates                      : derived variable
    RANGE fopenHHtauInf                     : derived variable
    RANGE fopenHHratesTau                   : derived variable
    RANGE fopenHHratesInf                   : derived variable
    RANGE fopenHHratesTauInf                : derived variable
    
}

UNITS {
    
    (nA) = (nanoamp)
    (uA) = (microamp)
    (mA) = (milliamp)
    (A) = (amp)
    (mV) = (millivolt)
    (mS) = (millisiemens)
    (uS) = (microsiemens)
    (molar) = (1/liter)
    (kHz) = (kilohertz)
    (mM) = (millimolar)
    (um) = (micrometer)
    (S) = (siemens)
    
}

PARAMETER {
    
    gmax = 0  (S/cm2)                       : Will be changed when ion channel mechanism placed on cell!
    
    conductance = 0 (uS)
    m_instances = 3 
    m_forwardRate_TIME_SCALE = 1 (ms)
    m_forwardRate_VOLT_SCALE = 1 (mV)
    m_forwardRate_VT = -55 
    m_reverseRate_TIME_SCALE = 1 (ms)
    m_reverseRate_VOLT_SCALE = 1 (mV)
    m_reverseRate_VT = -55 
    h_instances = 1 
    h_forwardRate_TIME_SCALE = 1 (ms)
    h_forwardRate_VOLT_SCALE = 1 (mV)
    h_forwardRate_VT = -55 
    h_reverseRate_TIME_SCALE = 1 (ms)
    h_reverseRate_VOLT_SCALE = 1 (mV)
    h_reverseRate_VT = -55 
}

ASSIGNED {
    
    gion   (S/cm2)                          : Transient conductance density of the channel? Standard Assigned variables with ionChannel
    v (mV)
    celsius (degC)
    temperature (K)
    ena (mV)
    ina (mA/cm2)
    
    
    m_forwardRate_V                        : derived variable
    
    m_forwardRate_r (kHz)                  : derived variable
    
    m_reverseRate_V                        : derived variable
    
    m_reverseRate_r (kHz)                  : derived variable
    
    m_rateScale                            : derived variable
    
    m_alpha (kHz)                          : derived variable
    
    m_beta (kHz)                           : derived variable
    
    m_fcond                                : derived variable
    
    m_inf                                  : derived variable
    
    m_tau (ms)                             : derived variable
    
    h_forwardRate_V                        : derived variable
    
    h_forwardRate_r (kHz)                  : derived variable
    
    h_reverseRate_V                        : derived variable
    
    h_reverseRate_r (kHz)                  : derived variable
    
    h_rateScale                            : derived variable
    
    h_alpha (kHz)                          : derived variable
    
    h_beta (kHz)                           : derived variable
    
    h_fcond                                : derived variable
    
    h_inf                                  : derived variable
    
    h_tau (ms)                             : derived variable
    
    conductanceScale                       : derived variable
    
    fopenHHrates                           : derived variable
    
    fopenHHtauInf                          : derived variable
    
    fopenHHratesTau                        : derived variable
    
    fopenHHratesInf                        : derived variable
    
    fopenHHratesTauInf                     : derived variable
    
    fopen                                  : derived variable
    
    g (uS)                                 : derived variable
    rate_m_q (/ms)
    rate_h_q (/ms)
    
}

STATE {
    m_q 
    h_q 
    
}

INITIAL {
    ena = 50.0
    
    temperature = celsius + 273.15
    
    rates()
    rates() ? To ensure correct initialisation.
    
    m_q = m_inf
    
    h_q = h_inf
    
}

BREAKPOINT {
    
    SOLVE states METHOD cnexp
    
    ? DerivedVariable is based on path: conductanceScaling[*]/factor, on: Component(id=Na_CML type=ionChannelHH), from conductanceScaling; null
    ? Path not present in component, using factor: 1
    
    conductanceScale = 1 
    
    ? DerivedVariable is based on path: gatesHHrates[*]/fcond, on: Component(id=Na_CML type=ionChannelHH), from gatesHHrates; Component(id=m type=gateHHrates)
    fopenHHrates = m_fcond * h_fcond ? multiply applied to all instances of fcond in: <gatesHHrates> ([Component(id=m type=gateHHrates), Component(id=h type=gateHHrates)]) c2 ([Component(id=null type=annotation), Component(id=null type=notes), Component(id=m type=gateHHrates), Component(id=h type=gateHHrates)]) ? path based
    
    ? DerivedVariable is based on path: gatesHHtauInf[*]/fcond, on: Component(id=Na_CML type=ionChannelHH), from gatesHHtauInf; null
    ? Path not present in component, using factor: 1
    
    fopenHHtauInf = 1 
    
    ? DerivedVariable is based on path: gatesHHratesTau[*]/fcond, on: Component(id=Na_CML type=ionChannelHH), from gatesHHratesTau; null
    ? Path not present in component, using factor: 1
    
    fopenHHratesTau = 1 
    
    ? DerivedVariable is based on path: gatesHHratesInf[*]/fcond, on: Component(id=Na_CML type=ionChannelHH), from gatesHHratesInf; null
    ? Path not present in component, using factor: 1
    
    fopenHHratesInf = 1 
    
    ? DerivedVariable is based on path: gatesHHratesTauInf[*]/fcond, on: Component(id=Na_CML type=ionChannelHH), from gatesHHratesTauInf; null
    ? Path not present in component, using factor: 1
    
    fopenHHratesTauInf = 1 
    
    fopen = conductanceScale  *  fopenHHrates  *  fopenHHtauInf  *  fopenHHratesTau  *  fopenHHratesInf  *  fopenHHratesTauInf ? evaluable
    g = conductance  *  fopen ? evaluable
    gion = gmax * fopen 
    
    ina = gion * (v - ena)
    
}

DERIVATIVE states {
    rates()
    m_q' = rate_m_q 
    h_q' = rate_h_q 
    
}

PROCEDURE rates() {
    
    m_forwardRate_V = v /  m_forwardRate_VOLT_SCALE ? evaluable
    m_forwardRate_r = (-0.32 * ( ( m_forwardRate_V  -  m_forwardRate_VT ) - 13 ) / ( (exp (-1*( ( m_forwardRate_V  -  m_forwardRate_VT ) - 13 ) / 4)) - 1)) /  m_forwardRate_TIME_SCALE ? evaluable
    m_reverseRate_V = v /  m_reverseRate_VOLT_SCALE ? evaluable
    m_reverseRate_r = (0.28 * ( ( m_reverseRate_V  -  m_reverseRate_VT ) - 40 ) / ((exp (( ( m_reverseRate_V  -  m_reverseRate_VT ) - 40 ) / 5)) - 1)) /  m_reverseRate_TIME_SCALE ? evaluable
    ? DerivedVariable is based on path: q10Settings[*]/q10, on: Component(id=m type=gateHHrates), from q10Settings; null
    ? Path not present in component, using factor: 1
    
    m_rateScale = 1 
    
    ? DerivedVariable is based on path: forwardRate/r, on: Component(id=m type=gateHHrates), from forwardRate; Component(id=null type=Na_CML_m_alpha_rate)
    m_alpha = m_forwardRate_r ? path based
    
    ? DerivedVariable is based on path: reverseRate/r, on: Component(id=m type=gateHHrates), from reverseRate; Component(id=null type=Na_CML_m_beta_rate)
    m_beta = m_reverseRate_r ? path based
    
    m_fcond = m_q ^ m_instances ? evaluable
    m_inf = m_alpha /( m_alpha + m_beta ) ? evaluable
    m_tau = 1/(( m_alpha + m_beta ) *  m_rateScale ) ? evaluable
    h_forwardRate_V = v /  h_forwardRate_VOLT_SCALE ? evaluable
    h_forwardRate_r = (0.128 * (exp (-1*( ( h_forwardRate_V  -  h_forwardRate_VT ) - 17 ) / 18))) /  h_forwardRate_TIME_SCALE ? evaluable
    h_reverseRate_V = v /  h_reverseRate_VOLT_SCALE ? evaluable
    h_reverseRate_r = (4 / ( 1 + (exp (-1*( ( h_reverseRate_V  -  h_reverseRate_VT ) - 40 ) / 5)))) /  h_reverseRate_TIME_SCALE ? evaluable
    ? DerivedVariable is based on path: q10Settings[*]/q10, on: Component(id=h type=gateHHrates), from q10Settings; null
    ? Path not present in component, using factor: 1
    
    h_rateScale = 1 
    
    ? DerivedVariable is based on path: forwardRate/r, on: Component(id=h type=gateHHrates), from forwardRate; Component(id=null type=Na_CML_h_alpha_rate)
    h_alpha = h_forwardRate_r ? path based
    
    ? DerivedVariable is based on path: reverseRate/r, on: Component(id=h type=gateHHrates), from reverseRate; Component(id=null type=Na_CML_h_beta_rate)
    h_beta = h_reverseRate_r ? path based
    
    h_fcond = h_q ^ h_instances ? evaluable
    h_inf = h_alpha /( h_alpha + h_beta ) ? evaluable
    h_tau = 1/(( h_alpha + h_beta ) *  h_rateScale ) ? evaluable
    
     
    
     
    
     
    
     
    
     
    
     
    
     
    
     
    
     
    
     
    rate_m_q = ( m_inf  -  m_q ) /  m_tau 
    
     
    
     
    
     
    rate_h_q = ( h_inf  -  h_q ) /  h_tau 
    
     
    
     
    
     
    
}

