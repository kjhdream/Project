## Terraform 세부사항 - Infra
### - Terraform Architecture
![image](https://user-images.githubusercontent.com/117608997/215787778-f8978493-c220-4730-bbdd-b12606e77ec0.png)

## Terraform File 구성
### - Network
- VPC
- Subnet

</br>

### - Firewall
```
terraform으로 따로 방화벽 설정 X → GKE에서 방화벽이 자동 생성됨
VPC 내부에 GKE만 있고, GKE 관련 방화벽 정책은 Google Cloud 완전 관리형으로 생성이 되기 때문에
추가적으로 설정해줄 필요가 없음
```

</br>

### - Cloud SQL
- VPC 피어링 용도의 서브넷 주소를 생성
- VPC와 db를 피어링하는 설정
- Google SQL 데이터베이스 인스턴스 생성
- petclinic_db_ane3 에 들어갈 데이터 베이스 생성
- petclinic_db_ane3의 사용자와 P/W 생성

</br>

### - GKE
- GKE 클러스터 및 정책 구성
- GKE Node Pool 및 정책 구성

</br>

### - GAR
-  접근제어 방법 : IAM Policy, Binding, Member

</br>

### - GCS
- 접근제어 정책 구성 설정

</br>

### - Output
- DB 프라이빗 IP 출력
- ingress IP 출력

</br>

### - DNS
-DNS 영역 생성 및 DNS 등록
-a 레코드 추가

</br>

### - ip_address
- HTTP(S) 부하 분산에 사용할 고정 ip 생성

</br>

### - NAT
- 라우터 리소스 등록
- NAT 생성

</br>

## Terraform Cloud - CI/CD
![image](https://user-images.githubusercontent.com/117608997/215809198-bbd1f71e-4175-4702-9ca4-acc8554521be.png)

### ✅ 구현 목표
```
사용자를 Owner와 Ops 그룹으로 분류하여 권한을 다르게 설정해주는 것이 목표
- Owner : `모든 권한`을 가지고 있음
- Ops : `apply`를 제외한 `plan` 단계까지 `run` 가능, `변수` read/wirte, `tfstate` read only
```

</br>

### ✅ 구현 과정
### 1. Workspaces > Workspace 선택
![image](https://user-images.githubusercontent.com/117608997/215797468-fc0f982c-16fd-40ca-aa80-9d4d07fdfbdf.png)

</br>

### 2. Settings > Team Access > Add team and permissions
![image](https://user-images.githubusercontent.com/117608997/215797490-33a595f0-3574-4c7c-80e6-5055e012414f.png)
![image](https://user-images.githubusercontent.com/117608997/215797519-45ebabe4-8a46-4df3-ae8f-b15582d9d821.png)

</br>

### 3. Select team
![image](https://user-images.githubusercontent.com/117608997/215797534-54561fa5-089c-4393-a069-58238c7dda56.png)

</br>

### 4. Team Permissions 설정
- 상세 권한 설정
![image](https://user-images.githubusercontent.com/117608997/215797551-f37cf564-bde3-48f3-8c24-df91e5b802b2.png)
![image](https://user-images.githubusercontent.com/117608997/215797573-23fea3f4-c93d-4504-9e29-f9306edbdb1c.png)

</br>

### 5. 테스트 및 결과
```
권한 없는 그룹(Ops) 사용자로 RUN 실행 시,  Plan은 되지만 Apply는 불가능 한 것을 확인
```

