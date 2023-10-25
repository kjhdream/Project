## 📅 WBS
![image](https://user-images.githubusercontent.com/117608997/216758323-ad6bb1e5-ec84-4022-bb90-900a0ae87b2b.png)

</br>

## 🔎 Monitoring
### Monitoring Tools
![image](https://user-images.githubusercontent.com/117608997/215812977-a719c414-a8ec-434a-8a6f-340f9e6d35a0.png)
```
Cloud Monitoring
- 리소스의 로그, 매트릭, 상태체크 대시보드 구성
Cloud Logging
- Log Data 수집 및 필터링
Fluentbit
- 각 Pod 들의 Log Data 수집
Big Query
- 필터링 된 Log Data 저장 및 테이블화
Looker
- Big Query에 저장된 Log Data의 분석 및 보고서화
```

</br>

### Monitoring Visualization
- Looker
![image](https://user-images.githubusercontent.com/117608997/215815272-abb1b574-d001-41f0-9a98-b87efa6a2257.png)
```
HTTP(S) LB Log Data 분석 자료 시각화
- 위치 기반 Log Data 분석
- 시간 별 Log Data 분석
```

</br>

- Cloud Monitoring
![image](https://user-images.githubusercontent.com/117608997/215815952-7ce5a085-f141-4ce8-8a1c-0c5b1e0b714d.png)

</br>

### Application Monitoring
- HPA 테스트
![image](https://user-images.githubusercontent.com/117608997/215809925-15f84159-7fc9-4e1b-8303-427836a9f0db.png)
```
3분간 접속자 수를 400명으로 지정했을때 Pod의 개수가 증가
```

</br>

### Monitoring Alert
![image](https://user-images.githubusercontent.com/117608997/215816490-e57253e5-7aa1-4195-8b48-25105d06d8f0.png)
```
이상 상황 발생시 Alert 설정
- 웹페이지 정상 동작 확인
- DB 상태 확인
- Pod 상태 확인
```
