# 一.表格说明

- SkillCollision是Skill碰撞(攻击Box)配置表
- 一行一个碰撞(攻击Box),供SkillTemplate索引使用

# 二.表格字段说明

- 字段名加*表示有详细说明

| 字段名                | 字段含义            |
| --------------------- | ------------------- |
|ID|碰撞id|
|StartTime*|碰撞开始时间,相对于skill攻击段开始,单位ms|
|DelayTime*|碰撞延迟时间,单位ms|
|Availability*|碰撞生效次数|
|Interval*|碰撞生效间隔时间,单位ms|
|LifeTime*|碰撞持续时间|
|ColTarget*|碰撞目标,哪些类别对象加入碰撞检测|
|TargetType*|目标选择规则,选择Box出现的位置|
|Offset*|Box位置偏移|
|BackUpOffset*|备用Box位置偏移|
|Size*|Box大小,格式(x,y,z),单位m|
|RotateHor*|Box绕y轴的旋转速度,单位?|
|RotateVer*|Box绕x轴的旋转速度,单位?|
|DragPosition*|牵引位置,格式(x,y,z),单位m|
|DragDirection*|牵引方向|
|DragTime*|牵引开始时间,相对于skill攻击段开始,单位ms|
|DragLifeTime*|牵引持续时间,单位ms|
|DragSpeed*|牵引速度,单位m/s|
|OnHitFxId|击中特效|
|OnHitCameraShakeId|击中镜头震动|
|AudioPlayCondition|音效|
|OnHitAudioId|击中音效|
|Buffs*|击中加buff|
|IsAbProb*|击中加buff,是否按绝对概率触发|
|RandomBuffMin*|随机取值区间最小值|
|RandomBuffMax*|随机取值区间最大值|
|Auras|击中加aura,格式auraID,auraLv;auraID,auraLv...|
|PreBuff*|击中加buff的前置buff条件,格式buffID|
|OnHitID|击中受击表现id,索引SkillOnHit表ID字段|
|HurtID|击中受击伤害id,索引SkillHurt表HurtID字段|

# 三.表格字段详细说明

- StartTime,DelayTime,Availability,Interval,LifeTime
  - 各时间值关系为:
    - Skill攻击段开始|StartTime|DelayTime|LifeTime
    - LifeTime为:ValidTime|Interval|ValidTime|...|Interval|ValidTime
  - ValidTime为碰撞有效时间,一共有Availability个
  - Box处在不同ValidTime内当成不同Box处理
  - DelayTime是为了延后Box的生效时间,让目标对象可以躲避
    - Box的位置通过TargetType字段在StartTime结束时选择
    - Box在DelayTime结束后才起作用
- ColTarget
  - 0  敌方
  - 1  友方
  - 2  自己
  - 可配多个,分号分隔
- TargetType,Offset,BackUpOffset
  - TargetType定义选目标的规则,Offset,BackUpOffset是不同规则下使用的偏移坐标
  - TargetType分为6个部分:
    - 目标类型(1)
      - 施法者自身
      - 当前锁定的敌方目标,若没有锁定的敌方目标,则使用备选位置
        - NPC没有锁定的地方目标
      - 距离最近的敌方目标
      - 带有指定buff的敌方目标
      - 随机敌方目标
    - 目标类型补充参数(2),和目标类型(1)一一对应
      - 无
      - 最大距离,单位m,若当前锁定目标与施法者距离超过最大距离,则使用备选位置
      - 筛选范围,单位m,若筛选范围内没有敌方目标,则使用备选位置
      - buffID,buffLv,筛选范围,单位m,选择筛选范围内带有指定buff(id,lv)离施法者最近的敌方目标,若筛选范围内没有敌方目标,则使用备选位置
      - 随机编号,筛选中心(x,y,z),随机范围,单位m,以施法者为中心,施法者面向为方向,进行偏移(筛选中心),在筛选范围内随机敌方目标,若筛选范围内没有敌方目标,则使用备选位置
    - 目标点位置(3),得到目标位置和碰撞初始方向
      - 目标中心点
        - 目标位置:目标中心点
        - 碰撞初始方向:同目标面向
      - 目标背后
        - 目标位置:目标面向反向与目标size圆的交点
        - 碰撞初始方向:同目标面向
      - 目标身前
        - 目标位置:目标size圆与"施法者中心-目标中心"连线交点
        - 碰撞初始方向:"施法者中心-目标中心"连线方向
      - 目标身后
        - 目标位置:目标size圆与"施法者中心-目标中心"连线延长线交点
        - 碰撞初始方向:施法者中心-目标中心"连线方向
    - 取地面位置(4)
      - 0  使用施法者坐标y值
      - 1  使用碰撞点在地面的投影y值
    - 偏移坐标轴(5)
      - 1  用施法者的朝向进行坐标偏移
      - 2  用目标的朝向进行坐标偏移
    - 随机范围(6)
      - 随机编号,随机范围(x,y,z)
  - TargetType各目标类型使用参数的流程:
    - 施法者自身
      - 碰撞位置:
        - 取施法者坐标
        - 在施法者面向上做Offset偏移
        - 使用随机范围(6),做随机
      - 碰撞初始方向:取施法者面向
    - 当前锁定的敌方目标/距离最近的敌方目标/带有指定buff的敌方目标/随机敌方目标
      - 碰撞位置:
        - 判断目标类型补充参数(2),如果不满足,使用备选位置
        - 使用目标点位置(3),获得目标位置,碰撞初始方向
        - 使用取地面位置(4),获取碰撞点y值
        - 判断偏移坐标轴(5),用Offset做偏移
        - 使用随机范围(6),做随机
      - 碰撞初始方向:在计算碰撞位置时获得
    - 使用备选位置
      - 碰撞位置:
        - 取施法者坐标
        - 在施法者面向上做BackUpOffset偏移
      - 碰撞初始方向:取施法者面向

- Size,RotateHor,RotateVer
  - 使用方式参加<<攻击判定.md>>文档
- DragPosition,DragDirection,DragTime,DragLifeTime,DragSpeed
  - 牵引范围是借用Size字段吗?
  - Box多段起效,会影响牵引吗?
- Buffs,IsAbProb,RandomBuffMin,RandomBuffMax
  - FlyBomb表也有相同字段!
  - Buffs格式为buffID,buffLv,pb;buffID,buffLv,pb...
    - pb == 0 表示必触发buff,直接加
    - pb > 0   表示相对触发概率的权重/绝对触发概率
  - IsAbProb
    - 1按绝对概率判断
    - 0按相对概率判断
  - RandomBuffMin,RandomBuffMax
    - 从[RandomBuffMin,RandomBuffMax]随机一个数,表示抽取buff多少次
  - 绝对概率判断
    - 假设有buff1,1,40;buff2,1,30;buff3,1,20,随机抽取2次
    - 第一次抽取,抽中buff1概率40%,抽中buff2概率30%,抽中buff3概率20%,抽不到buff概率10%
    - 假设第一次抽中buff1,移除buff1,第二次抽,抽中buff2概率30%,抽中buff3概率20%,抽不到buff概率50%
    - 假设第一次抽中buff2,移除buff2,第二次抽,抽中buff1概率40%,抽中buff3概率20%,抽不到buff概率40%
    - 假设第一次抽中buff3,移除buff3,第二次抽,抽中buff1概率40%,抽中buff2概率30%,抽不到buff概率30%
    - 一共随机抽出0~2个buff
  - 相对概率判断
    - 假设有buff1,1,40;buff2,1,30;buff3,1,20,随机抽取2次
    - 第一次抽取,抽中buff1概率40/(40+30+20),抽中buff2概率30/(40+30+20)抽中buff3概率20/(40+30+20)
    - 假设第一次抽中buff1,移除buff1,第二次抽,抽中buff2概率30/(30+20),抽中buff3概率20/(30+20)
    - 假设第一次抽中buff2,移除buff2,第二次抽,抽中buff1概率40/(40+20),抽中buff3概率20/(40+20)
    - 假设第一次抽中buff3,移除buff3,第二次抽,抽中buff1概率40/(40+30),抽中buff2概率30/(40+30)
    - 一共随机抽出2个buff
    - 如果随机抽取次数>buff数,则不用判断,全部添加
- PreBuff
  - 如果有配置PreBuff,表示当攻击Box命中后,需要判断发起Skill对象身上有没有该buff
  - 如果有,才可以将配的buff(Buffs字段)加到受击对象身上
  - 在创建Box的时候判断preBuff,并记录(leo),而不是击中时判断