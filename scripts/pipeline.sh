#!/bin/bash

# RNA-seq Pipeline Script
# Author: Chomphunut Unmee

PROJECT_DIR=$HOME/rna_seq_project
RAW_DIR=$PROJECT_DIR/data/raw
PROCESSED_DIR=$PROJECT_DIR/data/processed
FASTQC_DIR=$PROJECT_DIR/results/fastqc
TRIMMOMATIC=/usr/share/java/trimmomatic.jar
ADAPTERS=/usr/share/trimmomatic/TruSeq3-SE.fa
LOG_FILE=$PROJECT_DIR/results/pipeline.log

# Function: log message
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a $LOG_FILE
}

# Function: check if command succeeded
check_success() {
    if [ $? -eq 0 ]; then
        log "SUCCESS: $1"
    else
        log "ERROR: $1 failed — stopping pipeline"
        exit 1
    fi
}

echo "================================" | tee $LOG_FILE
log "RNA-seq Pipeline Starting"
echo "================================" | tee -a $LOG_FILE

# Step 1: Quality Check
log "Step 1: Running FastQC..."
fastqc $RAW_DIR/sample_R1.fastq -o $FASTQC_DIR/
check_success "FastQC"

# Step 2: Trimming
log "Step 2: Running Trimmomatic..."
java -jar $TRIMMOMATIC SE -phred33 \
    $RAW_DIR/sample_R1.fastq \
    $PROCESSED_DIR/sample_R1_trimmed.fastq \
    ILLUMINACLIP:$ADAPTERS:2:30:10 \
    LEADING:3 TRAILING:3 \
    SLIDINGWINDOW:4:15 MINLEN:36
check_success "Trimmomatic"

echo "================================" | tee -a $LOG_FILE
log "Pipeline Complete!"
log "Results saved to: $PROJECT_DIR/results/"
echo "================================" | tee -a $LOG_FILE
