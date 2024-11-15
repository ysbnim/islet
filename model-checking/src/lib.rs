mod common;
#[cfg(feature = "mc_rmi_features")]
mod rmi_features;
#[cfg(feature = "mc_rmi_granule_delegate")]
mod rmi_granule_delegate;
#[cfg(feature = "mc_rmi_granule_undelegate")]
mod rmi_granule_undelegate;
#[cfg(feature = "mc_rmi_realm_activate")]
mod rmi_realm_activate;
#[cfg(feature = "mc_rmi_realm_destroy")]
mod rmi_realm_destroy;
#[cfg(feature = "mc_rmi_rec_aux_count")]
mod rmi_rec_aux_count;
#[cfg(feature = "mc_rmi_rec_destroy")]
mod rmi_rec_destroy;
#[cfg(feature = "mc_rmi_version")]
mod rmi_version;
