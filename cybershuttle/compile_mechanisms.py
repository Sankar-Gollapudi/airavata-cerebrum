from bmtk.utils.create_environment import create_environment

create_environment(
    'bionet',
    base_dir='.',                      
    config_file='config.l4.json',   
    network_dir='network',             
    output_dir='output' ,       
    tstop=3000.0, dt=0.1,              
    spikes_inputs=[('lgn', 'inputs/lgn_spikes.h5')],
    report_vars=['v'],                 
    compile_mechanisms=True,           
    overwrite=True,       
)