# CloneTagger
Flag ntuple entries as being identical multiple candidates ("clones") based on track key

## Preamble
This project is an adaptation of some source code sent to me by my PhD supervisor, Matthew Needham.
Its purpose is to identify candidates formed from identical sets of tracks, which is particularly important for decays with multiple intermediate particles of the same species, such as B<sub>s</sub>→ϕϕ.

Note that the usage of *clone* here differs from that defined in *e.g.* [LHCb-INT-2016-045](https://cds.cern.ch/record/2229732), where the same real track is assigned multiple keys.
