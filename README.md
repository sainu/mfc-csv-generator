# MFC CSV generator

## Setup

First, install Ruby using any way that matchies the version in the `.ruby-version` file.

## Usage

Execute any ruby file in `scripts` directory.

```
ruby scripts/receivable.rb
```

Answer the questions as prompted.

```
> Enter the namespace of '請求書番号'
0723-
> Enter the start number of '請求書番号'
1
> Enter '請求書コード'
sainu
> Enter the number of rows
1000
> Create a new file? (y/n)
y
Creating csv directory...
Creating csv file...
File created: csv/receivable_invoices.csv
```

That's all.
