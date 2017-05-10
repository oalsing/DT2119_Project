tools/prepare_data.sh


features=MELSPEC_0_D_A

tools/train_g-hmm.sh $features

tools/test_g-hmm.sh $features

results_$features/results_g-hmm.txt

tools/train_gmm-hmm.sh $features

tools/test_gmm-hmm.sh $features

results_$features/results_gmm-hmm.txt

python3 data_split.py

ls/forced_align_states.sh MFCC_0_D_A

workdir/train_tr_align.mlf
workdir/train_va_align.mlf
workdir/test_align.mlf

tools/phones2stateid.py workdir/phones1.lst > workdir/state2id.lst

tools/htk2pfile.py workdir/train_tr_align.mlf workdir/state2id.lst FBANK \
     workdir/train_tr_FBANK.pfile
tools/htk2pfile.py workdir/train_va_align.mlf workdir/state2id.lst FBANK \
     workdir/train_va_FBANK.pfile
tools/htk2pfile.py workdir/test_align.mlf workdir/state2id.lst FBANK \
     workdir/test_FBANK.pfile

pfile_norm -i workdir/train_tr_FBANK.pfile -o workdir/train_tr_FBANK_norm.pfile
pfile_norm -i workdir/train_va_FBANK.pfile -o workdir/train_va_FBANK_norm.pfile
pfile_norm -i workdir/test_FBANK.pfile -o workdir/test_FBANK_norm.pfile




