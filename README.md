# 🧬 RNA-seq Analysis Pipeline

An automated bioinformatics pipeline for RNA-seq data processing,
built with Bash scripting and standard bioinformatics tools.

---

## 📌 Project Overview

This pipeline automates the quality control and trimming steps 
of RNA-seq data analysis — from raw FASTQ files through to 
clean, analysis-ready reads. Designed to be modular, reusable, 
and extensible for different datasets.

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| FastQC | Quality control of raw FASTQ reads |
| Trimmomatic | Adapter trimming and quality filtering |
| Bash | Pipeline automation and workflow scripting |

---

## 🔄 Pipeline Steps

```
Raw FASTQ → FastQC (QC) → Trimmomatic (Trim) → Clean FASTQ
```

**Step 1 — FastQC:** Quality check raw reads, generate HTML report  
**Step 2 — Trimmomatic:** Remove adapters and low quality reads  

---

## 📁 Project Structure

```
rnaseq_pipeline/
├── data/
│   ├── raw/           ← Raw FASTQ files
│   └── processed/     ← Trimmed FASTQ output
├── results/
│   ├── fastqc/        ← FastQC HTML reports
│   └── pipeline.log   ← Pipeline run log with timestamps
└── scripts/
    └── pipeline.sh    ← Main pipeline script
```

---

## 🚀 How to Run

**1. Install dependencies (Ubuntu/WSL)**
```bash
sudo apt install fastqc trimmomatic default-jre -y
```

**2. Clone the repository**
```bash
git clone https://github.com/mukiskaijeaw/rnaseq-pipeline.git
cd rnaseq-pipeline
```

**3. Add your FASTQ file**
```bash
cp your_sample.fastq data/raw/
```

**4. Run the pipeline**
```bash
bash scripts/pipeline.sh
```

**5. Check results**
```bash
cat results/pipeline.log
ls results/fastqc/
```

---

## 📊 Key Features

- Automated quality control and trimming in a single script
- Timestamp logging for every step
- Error handling — pipeline stops immediately if any step fails
- Log file saved to `results/pipeline.log` for reproducibility

---

## 👩‍💻 Author

**Chomphunut Unmee**  
Bioscience & Technology Graduate | Aspiring Bioinformatics Researcher  
[GitHub](https://github.com/mukiskaijeaw)
