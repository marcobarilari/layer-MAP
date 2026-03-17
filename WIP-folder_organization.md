## YODA folder

```bash
.
├── code
│   ├── lib # where VASOpipeline lives
│   ├── src # where your code and the the batch file to run VASOpipeline live
├── inputs
│   └── raw # your awesome raw dataset + other input to not touch, ideally bidslike format
└── outputs
    └── derivates # where any processed file will be saved in seprate subfolders named by `software-step` 
```

## Derivatives option 1

pros: separates the analysis streamsin not too many folders
cons: the structure might not make sense in a bids derivatives fashion after sub-**

```bash
└── derivatives
    ├── layerMAP-logfiles
    │   ├── sub-01
    │   └── sub-02
    └── layerMAP-segmentation-layer
    │   ├── sub-01
    │   │   ├── SUMA
    │   │   ├── freesurfer
    │   │   └── rim-layers
    │   └── sub-02
    │       ├[...]
    └── layerMAP-preprocessing
        ├── sub-01
        │   ├── moco
        │   ├── boco
        │   ├── figures
        │   ├── nordic-boco
        │   ├── nordic-boco
        │   ├── sub-01_qm_report_nordic.html
        │   └── sub-01_qm_report_nordic.html
        └── sub-02
            ├[...]
```

## Derivatives option 2

pros: easy to be serapated in single "light" folders after derivatives so easy to be andled by datalad/git-annex
cons: too many subfolder after derivatives

```bash
└── derivatives
    └── layerMAP-segmentation
    |   ├── logfiles
    │   │   ├── sub-01
    │   │   └── sub-02
    │   ├── sub-01
    │   │   ├── freesurfer
    │   │   └── presurf_MPRAGEise
    │   └── sub-02
    │       ├[...]
    └── layerMAP-surface-mesh
    │   ├── sub-01
    │   │   └──  SUMA
    │   └── sub-02
    │       ├[...]
    └── layerMAP-rim-layers
    │   ├── sub-01
    │   │   └──  roi
    │   └── sub-02
    │       ├[...]
    └── layerMAP-preprocessing
        ├── sub-01
        │   ├── moco
        │   ├── boco
        │   ├── figures
        │   ├── nordic-boco
        │   ├── nordic-boco
        │   ├── sub-01_qm_report_nordic.html
        │   └── sub-01_qm_report_nordic.html
        └── sub-02
            ├[...]
```

## Derivatives option 1

pros: folder structure is much less convolutes
cons: folders will get really heavy adn in case one wants to use datalad/git-annex at the level of `layer-MAP` this will be too big to be easily handled by datalad/git-annex

```bash
└── derivatives
    └── layer-MAP
        ├── logfiles
        ├── sub-01
        |   ├── sub-01_qm_report.html   # quality metrics report for the data propcessed w/o nordic filtering
        |   ├── sub-01_qm_report_nordic.html   # quality metrics report for the data propcessed with nordic filtering
        |   ├── anat                    # copy of the raw + upsampled anatomical
        |   |   ├── presurf_MPRAGEise   # bias coprrected anat (freesurfer input)
        |   |   └── freesurfer
        |   |       └── surf
        |   |           └── SUMA        # upsampled mesh files
        |   ├── figures                 # where figures lives for the report
        |   ├── func                    # preprocessed vaso timeseries
        |   |   ├── nordic              # preprocessed files with nordic
        |   |   └── [...]               # preprocessed files without nordic
        |   └── roi                     # rim and layers masks
        └── sub-02
            └── [...]                   # preprocessed files without nordic

```