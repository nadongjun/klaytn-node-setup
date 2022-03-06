# Klaytn Node Setup

## Script

### servicechain.sh 
- 바이너리 파일 설치 및 노드 설정, 실행 스크립트
- 루트 폴더에 레퍼지토리 설치 후 실행
```sh
installBinary # kscn, homi 압축 파일 설치 및 압축 해제
```

```sh
generateNodeKeyAndGenesisBlock # 제네시스 블록, Node Key 생성
```

```sh
configuration # 포트 번호 수정 및 데이터 폴더 설정
```

```sh
runningServiceChainNode # 서비스 체인 노드 실행
```

### removeAll.sh 
- 노드 설정 전체 삭제 