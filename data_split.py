import re
import random

if __name__=='__name__':
    with open('workdir/train.lst') as f:
        filenames = f.readlines()
    random.shuffle(filenames)
    train_size = int((len(filenames)*0.9))
    with open('workdir/train_tr.lst', 'w+') as f:
        f.write("".join(filenames[:train_size]))
    with open('workdir/train_va.lst', 'w+') as f:
        f.write("".join(filenames[train_size:]))

    man_ratio_tot = len([1 for name in filenames if re.match(r'.*\/\/man\.*/', name)])/len(filenames)
    man_ratio_test = len([1 for name in filenames[:train_size] if re.match(r'.*\/\/man\.*/', name)])/train_size
    man_ratio_val = len([1 for name in filenames[train_size:] if re.match(r'.*\/\/man\.*/', name)])/(len(filenames)-train_size)
    print('ratio of man samples in total {:.04f}'.format(man_ratio_tot) )
    print('ratio of man samples in test {:.04f}'.format(man_ratio_test) )
    print('ratio of man samples in val {:.04f}'.format(man_ratio_val) )