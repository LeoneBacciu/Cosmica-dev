#ifndef VariableStructure
#define VariableStructure

// Struct with threads, blocks and share memory with which launch a cuda function
typedef struct LaunchParam_t {
  int Npart = 0;
  int threads = 0;
  int blocks = 0;
  int smem = 0;
} LaunchParam_t;

// Heliospheric physical parameters
typedef struct InputHeliosphericParameters_t { 
float k0        =0 ;
float ssn       =0 ;
float V0        =0 ;
float TiltAngle =0 ;
float SmoothTilt=0 ;
float BEarth    =0 ;
int Polarity    =0 ;
int SolarPhase  =0 ;
float NMCR      =0 ;
float Rts_nose  =0 ;
float Rts_tail  =0 ;
float Rhp_nose  =0 ;
float Rhp_tail  =0 ;
} InputHeliosphericParameters_t;

// Heliosheat physical parameters
typedef struct InputHeliosheatParameters_t {
float k0        =0 ;
float V0        =0 ; // solar wind at termination shock
} InputHeliosheatParameters_t;

// Struct of initial propagation positions arrays with coordinates and rigidities
typedef struct InitialPositions_t {
  float* r;       // heliocentric radial distances
  float* th;      // heliocentric polar angles
  float* phi;     // heliocentric azimutal - longitudinal angles (really needed in 2D model?)
} InitialPositions_t;

// Struct of quasi-particles arrays with coordinates, rigidities and time of flight
typedef struct QuasiParticle_t {
    float* r;         // heliocentric radial distances
    float* th;        // heliocentric polar angles
    float* phi;       // heliocentric azimutal - longitudinal angles (really needed in 2D model?)
    float* R;         // rigidity (GeV/n?)
    float* t_fly;     // total propagation time
    // float* alphapath; // Montecarlo statistical weight - exponent of c factor
} QuasiParticle_t;

// SEE IF WE CAN USE THE MATRIX CUDA UPTIMIZED LIBRARIES
// Struct with the structure of square root decomposition of symmetric difusion tensor
typedef struct Tensor3D_t {
  float rr=0;    
  float tr=0;    float tt=0;      
  float pr=0;    float pt=0;      float pp=0; // not null components
} Tensor_t;

// typedef struct Tensor_rad_t {
//   float rr=0;
//   float tr=0;
//   float pr=0;
// } Tensor_rad_t;

// typedef struct Tensor_theta_t {
//   float rr=0;
//   float tr=0;
//   float tt=0;      
//   float pt=0;
// } Tensor_theta_t;

// typedef struct Tensor_phi_t {
//   float rr=0;
//   float pr=0;
//   float pt=0;
//   float pp=0;
// } Tensor_phi_t;

// Struct with the structure of the the symmetric difusion tensor and its derivative
typedef struct DiffusionTensor_t {
  float rr=0;    
  float tr=0;    float tt=0;      
  float pr=0;    float pt=0;      float pp=0; 
  float DKrr_dr=0; float DKtr_dt=0; 
  float DKrt_dr=0; float DKtt_dt=0; 
  float DKrp_dr=0; float DKtp_dt=0;           // not null components
} DiffusionTensor_t;

// The radius component of the symmetric difusion tensor
// typedef struct DiffusionTensor_rad_t {
//   float rr=0;
//   float tr=0;
//   float pr=0;
//   float DKrr_dr=0;
//   float DKrt_dr=0;
//   float DKrp_dr=0;
//   float DKtr_dt=0;
// } DiffusionTensor_rad_t;  // 7 params

// The theta component of the symmetric difusion tensor
// typedef struct DiffusionTensor_theta_t {
//   float tt=0;
//   float tr=0;
//   float pt=0;
//   float DKrt_dr=0;
//   float DKtr_dt=0;
//   float DKtt_dt=0; 
//   float DKtp_dt=0;
// } DiffusionTensor_theta_t;  // 7 params

// The phi component of the symmetric difusion tensor
// typedef struct DiffusionTensor_phi_t {
//   float pr=0;
//   float pt=0;
//   float pp=0; 
//   float DKrp_dr=0;
//   float DKtp_dt=0;
// } DiffusionTensor_phi_t; // 5 params


// Struct with the structure of the advective-drift vector
typedef struct vect3D_t{
    float r         = 0;       // heliocentric radial component
    float th        = 0;       // heliocentric polar component
    float phi       = 0.;      // heliocentric azimutal - longitudinal angle component
} vect3D_t;

// Data container for output result of a single energy simulation
typedef struct MonteCarloResult_t {
  unsigned long Nregistered;
  int           Nbins;
  float         LogBin0_lowEdge;  // lower boundary of first bin
  float         DeltaLogR;        // Bin amplitude in log scale
  float         *BoundaryDistribution;
} MonteCarloResult_t;

#endif