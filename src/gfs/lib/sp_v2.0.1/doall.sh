OBJS="bll2ps.o spanaly.o spdz2uv.o speps.o spfft1.o       \
           spffte.o spfft.o spfftpt.o spgradq.o spgradx.o spgrady.o    \
           splaplac.o splegend.o sppad.o spsynth.o sptezd.o            \
           sptez.o sptezmd.o sptezm.o sptezmv.o sptezv.o sptgpmd.o     \
           sptgpm.o sptgpmv.o sptgpsd.o sptgps.o sptgpsv.o sptgptd.o   \
           sptgpt.o sptgptsd.o sptgptvd.o sptgptv.o sptrand.o sptran.o \
           sptranf0.o sptranf1.o sptranf.o sptranfv.o sptranv.o        \
           sptrund.o sptrun.o sptrung.o sptrungv.o sptrunl.o sptrunm.o \
           sptrunmv.o sptruns.o sptrunsv.o sptrunv.o spuv2dz.o         \
           spvar.o spwget.o splat.o ncpus.o"

mkdir -p tmp

for i in $OBJS; do
    mv ${i::-1}* tmp
done