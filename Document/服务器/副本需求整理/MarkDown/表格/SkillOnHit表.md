# 一.表格说明

- SkillOnHit是受击表现配置表
- 一行一个受击表现,供SkillCollision,FlyBomb表索引使用
- 定义在什么状态下,受到何种攻击,切到什么状态,做什么位移

# 二.表格字段说明

- 字段名加*表示有详细说明

| 字段名                | 字段含义            |
| --------------------- | ------------------- |
| ID                    | 受击表现id          |
| OnHitPerform*         | 受击类型            |
| HitCenter*            | 受击源              |
| HitLightAnimBlendTime | 原地受击blendTime   |
| HitLightTime          | 原地受击硬直时间    |
| HitLightMove*         | 原地受击位移        |
| HitBackAnimBlendTime  | 击退的blendTime     |
| HitBackTime           | 击退的硬直时间      |
| HitBackMove*          | 击退的位移          |
| HitDownAnimBlendTime  | 击倒的blendTime     |
| HitDownTime           | 击倒的硬直时间      |
| HitDownMove*          | 击倒的位移          |
| HitFlyAnimBlendTime   | 击飞的blendTime     |
| HitFlyTime            | 击飞的硬直时间      |
| HitFlyMove*           | 击飞的位移          |
| HitParryAnimBlendTime | 格挡反击的blendTime |
| HitParryTime          | 格挡反击的硬直时间  |
| HitParryMove*         | 格挡反击的位移      |

# 三.表格字段详细说明

- OnHitPerform
  - 受击类型:
    - -1  不做受击表现
    - 0   原地受击
    - 1   击退
    - 2   击飞
    - 3   格挡反击
- HitCenter
  - 计算受击方向使用的源坐标类型
    - 0   攻击Box中心点
    - 1   放技能的对象/放飞弹的对象/格挡对象的中心点
  - 单位米
- HitLightMove,HitBackMove,HitDownMove,HitFlyMove,HitParryMove
  - 不同状态下的受击位移,格式(t0,t1,x,y,z)
  - 单位(ms,ms,m,m,m)
  - 使用方式参考 <<位移&轨迹.md>>文档

# 四.选择受击状态,位移

- 根据受击对象的状态,选择当前受击状态
  - 原地受击
    - HitLight
  - 击退
    - HitBackOrStand
  - 击倒
    - HitDown
  - 击飞
    - HitFly
  - 格挡反击
    - HitParry
  - 其他状态
    - HitBackOrStand
- 如果受击对象不做受击表现,配置了不能被击退/击倒/击飞/格挡反击
  - 当前受击状态改为HitLight
- 根据当前受击状态,选择受击位移和受击硬直时间
  - HitLight
    - 选择HitLightMove和相应受击硬直
  - HitBackOrStand
    - 选择HitBackMove和相应受击硬直
  - HitDown
    - 选择HitDownMove和相应受击硬直
  - HitFly
    - 选择HitFlyMove和相应受击硬直
  - HitParry
    - 选择HitParryMove和相应受击硬直
- 根据当前受击状态和OnHitPerform,选择要切换的新受击状态
  - 当前受击状态 == HitLight
    - 新受击状态 = HitLight
  - 当前受击状态 == HitBackOrStand,HitParry
    - OnHitPerform == HitLight
      - 新受击状态 = HitLight
    - OnHitPerform == HitBackOrStand
      - 新受击状态 = HitBackOrStand
    - OnHitPerform == HitDown
      - 新受击状态 = HitDown
    - OnHitPerform == HitFly
      - 新受击状态 = HitFly
    - OnHitPerform == HitParry
      - 新受击状态 = HitParry
  - 当前受击状态 == HitDown
    - OnHitPerform == HitFly
      - 新受击状态 = HitFly
    - OnHitPerform != HitFly
      - 新受击状态 = HitDown
  - 当前受击状态 == HitFly
    - 新受击状态 = HitFly