
# Prepare data
tools/prepare_data.sh


features=MELSPEC_0_D_A
# Train g-hmm 
tools/train_g-hmm.sh $features
tools/test_g-hmm.sh $features

# Train gmm-hmm
tools/train_gmm-hmm.sh $features
tools/test_gmm-hmm.sh $features

## Split the data into training and validation data
#python3 data_split.py
#
## Create alignment
#tools/forced_align_states.sh MFCC_0_D_A
#
## Create labels
#tools/phones2stateid.py workdir/phones1.lst > workdir/state2id.lst
#
## Convert to pfile
#tools/htk2pfile.py workdir/train_tr_align.mlf workdir/state2id.lst FBANK \
#     workdir/train_tr_FBANK.pfile
#tools/htk2pfile.py workdir/train_va_align.mlf workdir/state2id.lst FBANK \
#     workdir/train_va_FBANK.pfile
#tools/htk2pfile.py workdir/test_align.mlf workdir/state2id.lst FBANK \
#     workdir/test_FBANK.pfile
#
## Normalize data
#pfile_norm -i workdir/train_tr_FBANK.pfile -o workdir/train_tr_FBANK_norm.pfile
#pfile_norm -i workdir/train_va_FBANK.pfile -o workdir/train_va_FBANK_norm.pfile
#pfile_norm -i workdir/test_FBANK.pfile -o workdir/test_FBANK_norm.
