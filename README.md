# terraform で GCP を試す

## できること
* GCE の CentOS7 のイメージのインスタンスを1つ作成する

## コマンド
### 構成
```
terraform apply -var-file=dev.tfvars 
```

### 破棄
```
terraform destroy -var-file=dev.tfvars 
```


