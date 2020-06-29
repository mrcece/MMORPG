# 一.表格说明

- FlyBomb是飞弹配置表
- 一行一个飞弹,供SkillTemplate表索引使用

# 二.表格字段说明

- 字段名加*表示有详细说明

| 字段名 | 字段含义 |
| ------ | -------- |
|ID|飞弹id|
|StartTime|开始时间,相对于skill攻击段开始时间,单位ms|
|LifeTime|持续时间,单位ms|
|StartPoint*|开始点|
|EndPoint*|结束点|
|CtrlPoints*|轨迹控制点|
|CtrlPointOffsets*|轨迹控制点随机偏移|
|SpeedCurve*|速度曲线|
|Size|攻击Box大小,单位m,使用方式参考<<攻击判定.md>>|
|CloseLand*|是否贴地飞行|
|PassThrough*|是否穿透|
|FlyFx|飞行中的特效|
|OnHitFxId|击中特效|
|OnCriticalHitFxId|暴击特效|
|OnHitCameraShakeId|击中镜头震动|
|AudioPlayCondition|音效|
|OnHitAudioId|击中音效|
|OnHitID|击中受击表现id,索引SkillOnHit表ID字段|
|HurtID|击中受击伤害id,索引SkillHurt表HurtID字段|
|Buffs*|击中加buff|
|IsAbProb*|击中加buff,是否按绝对概率触发|
|RandomBuffMin*|随机取值区间最小值|
|RandomBuffMax*|随机取值区间最大值|
|Auras|击中加aura,格式auraID,auraLv;auraID,auraLv...|
|PreBuff*|击中加buff的前置buff条件,格式buffID|
|DmgAttenuation*|伤害衰减|

# 三.表格字段详细说明

- StartPoint,EndPoint,CtrlPoints,CtrlPointOffsets,SpeedCurve
  - StartPoint,EndPoint定义飞弹轨迹的起点,终点,格式(x,y,z),单位m
  - CtrlPoints是飞弹轨迹中间的插值点,格式(x,y,z),单位m
    - 填(0,0,0)会不会有问题?
  - CtrlPointOffsets是对CtrlPoints的随机扰动,格式(x,y,z),单位m
    - CtrlPointOffsets点个数要和CtrlPoints点个数一致,如果少于,则用(0,0,0)补齐
    - 在(-x,x),(-y,y),(-z,z)范围内随机,然后叠加到CtrlPoints上去
  - 将StartPoint,叠加随机值后的CtrlPoints,EndPoint根据对象面向做转换
  - SpeedCurve控制飞弹轨迹的时间速度,如何使用?
- CloseLand
  - 贴地飞行,把曲线的高度(y)压低到地表
  - 离地的高度是多少?
- PassThrough
  - 是否穿透,怎么使用?
- Buffs,IsAbProb,RandomBuffMin,RandomBuffMax
  - 参考SkillCollision表相同字段
- PreBuff
  - 如果有配置PreBuff,表示当飞弹命中后,需要判断飞弹发起对象身上有没有该buff
  - 如果有,才可以将飞弹配的buff(Buffs字段)加到受击对象身上
  - 在创建飞弹时判断发起对象身上有没有buff,还是在命中时判断?
    - 创建飞弹时检查buff并记录下来,和复制属性一样(leo)
- DmgAttenuation
  - 根据飞行距离,计算伤害比例
  - 格式:飞行距离百分比,伤害比例千分比;飞行距离百分比,伤害比例千分比;飞行距离百分比,伤害比例千分比...
  - `当飞行距离<=飞行总距离*飞行距离百分比时,飞弹伤害=公式伤害*伤害比例千分比`
  - 飞行距离按受击点和起点的水平距离计算,不考虑y值
  - 不填留空,表示不使用伤害衰减