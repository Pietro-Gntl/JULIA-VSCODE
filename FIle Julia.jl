#print("Julia scusa per averti trattato male, tvb")

a=3
earth=Array{3,2}
G=6.67e-11
Ms=1.989e30
Mearth=5.972e24
mu_s=G*Ms
Menc=1.08022e20
Msat=5.683e26
mu_er=G*Mearth
mu_sat=G*Msat
mu_enc=G*Menc

r1=1*1.496e11
r2=10*1.496e11

Deltavcp=sqrt(mu_s/r1)*(sqrt(2*r2/(r1+r2))-1)
print("Δv_cp = ",Deltavcp,"m/s")
Deltavac=sqrt(mu_s/r2 *(1-sqrt(2*r1/(r1+r2))))
print("Δv_ac = ",Deltavac,"m/s") 
v_inf_E=Deltavcp
v_inf_sat=Deltavac

v_c=sqrt(mu_er/r1)
v_p=sqrt(2*(v_inf_E^2/2 + mu_er/r1))
deltav1= v_p-v_c
print("deltav1=", deltav1)


v_c_sat=sqrt(mu_sat/r2)
v_p_S=sqrt(2*(v_inf_sat^2/2 + mu_sat/r2))
deltav2=v_p_S-v_c_sat
print("deltav2=", deltav2)
print("deltavtot = ",deltav2 + deltav1 )


print("speed for circular orbit around enceladus = ",sqrt(G*Menc/(400*1000)),"m/s")

Circular_speed=134.211/1000 #km/s

#const G = 6.6743e-11

const Msu = 1.98847e30 #mass sun

const Mea = 5.9722e24 # mass eart

const Msa = 5.683e26 # mass saturn

const Men = 1.08022e20 # mass encleadus

const r_s_eu = 381000e3 # radius encleadus arround saturn

const AU = 1.496e11

const r_s_s = 1.4e12 # radius saturn arround sun

const parkorbit_eart = 6.671e6

const parkorbit_encleadus = 400000




v_orbit_enceladus=sqrt((G*Men)/parkorbit_encleadus)

dv1= sqrt((G*Msu)/AU)*(sqrt(2*r_s_s/(AU+r_s_s))-1) #eq10

dv2= sqrt((G*Msu)/r_s_s)*(-sqrt(2*r_s_s/(AU+r_s_s))+1) # eq 10

dv= dv1+dv2




dv_esc=sqrt(dv1^2+2*G*Mea/parkorbit_eart)-sqrt(G*Mea/parkorbit_eart) # eq 14

dv_arr=sqrt(dv2^2+2*G*Men/parkorbit_encleadus)-sqrt(G*Men/parkorbit_encleadus) # eq 18

dvtot=dv1+abs(dv2)+dv_esc+dv_arr # eq 19
dv_incl=2*v_orbit_enceladus*sin(pi/4)
