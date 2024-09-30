### 문제 설명

**난이도: 보통, 주제: 지역별 주문의 특징 분석, 제출 횟수: 10035번, 정답 횟수: 2877번, 정답률: 28.67%**

**US E-Commerce Records 2020** 데이터셋은 미국의 이커머스 웹사이트 판매 데이터를 제공합니다. 이 문제에서는 **records** 테이블을 이용하여 미국의 각 지역별로 어떤 카테고리의 상품이 많이 판매되는지를 분석하는 쿼리를 작성하는 것이 목표입니다.

- **records 테이블 컬럼**:
  - 주문 번호
  - 주문 날짜
  - 주문 지역 (**Region**)
  - 카테고리 (**Category**) 등

주요 카테고리는 **Furniture**, **Office Supplies**, **Technology**로 나뉘며, 이 세 가지 카테고리별로 각 지역에서의 주문량을 계산해야 합니다.

### 요구사항:
1. **Region**과 **Category**를 기준으로 주문 수를 집계
2. 결과는 **Region**을 기준으로 오름차순 정렬
3. 각 카테고리별로 해당 지역에서의 주문량을 출력

### 출력 컬럼:
- **Region**: 주문 지역
- **Furniture**: 해당 지역 내 가구(Furniture) 주문 수
- **Office Supplies**: 해당 지역 내 오피스 물품(Office Supplies) 주문 수
- **Technology**: 해당 지역 내 전자기기(Technology) 주문 수

### 결과 테이블 형식:
|Region|Furniture|Office Supplies|Technology|
|:--:|:--:|:--:|:--:|
|Central|XX|XX|XX|
|East|XX|XX|XX|
|South|XX|XX|XX|
|West|XX|XX|XX|

**해석**:
- **Region**: 미국의 주문 지역 (예: Central, East, South, West)
- **Furniture**: 해당 지역에서 판매된 가구 카테고리의 주문 수
- **Office Supplies**: 해당 지역에서 판매된 오피스 물품 카테고리의 주문 수
- **Technology**: 해당 지역에서 판매된 전자기기 카테고리의 주문 수

**예시**:
- Central 지역에서 **Furniture** 주문 수는 50건, **Office Supplies**는 100건, **Technology**는 80건으로 집계될 수 있습니다.
- South 지역에서는 **Technology** 주문 수가 가장 많을 수 있으며, **Furniture**는 상대적으로 적을 수 있습니다.
