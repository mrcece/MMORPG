# 一.表格说明

- SkillTemplate是技能配置表

- 一行配置一个技能(技能id+技能等级)

# 二.表格字段说明

- 字段名加*表示有详细说明

| 字段名                   | 字段含义                                                   |
| :----------------------- | :--------------------------------------------------------- |
| ID                       | 唯一id                                                     |
| TemplateID               | 技能id                                                     |
| Name                     | 技能名                                                     |
| Icon                     | 技能图标                                                   |
| Des                      | 技能描述                                                   |
| Level                    | 技能等级                                                   |
| SkillType*               | 技能类型,不同类型使用不同的字段                            |
| SkillClass*              | 技能分类,和SkillType无关(lizzy)                            |
| DamageType               | 技能伤害类型:物理/魔法,只是显示用?                         |
| PowerGet*                | 使用技能,获得能量,只能加一次                               |
| PowerConsume*            | 使用技能,消耗能量                                          |
| ThreatType*              | 仇恨值类型=>仇恨系统?                                      |
| ThreatRatio*             | 仇恨值系数                                                 |
| ThreatRange*             | 计算仇恨值的距离                                           |
| IsBlendSkill             | 是否混播                                                   |
| LinkSkillId              | 下一个连击技能id,冲刺技能的连接id                          |
| NextChargeSkillId        | 多蓄力技能下一段蓄力技能id?                                |
| IsQTE                    | 是否QTE技能                                                |
| QTETrigger               | QTE的触发条件                                              |
| QTEDelayTime             | QTE的icon延后显示的时间                                    |
| QTETime                  | 显示QTE icon的时长                                         |
| ParrySkillId*            | 格挡反击技能id:碰撞/飞弹                                   |
| ParryDirection*          | 格挡方向:前方/全方位                                       |
| ParryOnHitFxId           | 格挡受击特效                                               |
| SkillAreaId              | 技能显示范围                                               |
| UseCount*                | 使用次数,配合CD的吗?只有闪避会用                           |
| CD*                      | 一般CD                                                     |
| SerialCD*                | 连击技能CD,怎么用?                                         |
| SharedCoolDownID*        | 公共CD组s                                                  |
| IgnoreInputTime          | 忽略输入时间段                                             |
| CatchInputTime           | 记录输入时间段                                             |
| SoftTime                 | 衔接下一连击技能时间段                                     |
| ShowCastBar              | 是否显示吟唱技能条                                         |
| BreakSpasticityPriority* | 破硬直用的权重值,破攻击/受击硬直                           |
| IsSpasticity             | 是否有硬直,与下一字段重复                                  |
| SpasticityTime           | 硬直时间                                                   |
| BreakAttackSpasticity*   | 破攻击硬直                                                 |
| BreakBeHitSpasticity*    | 破受击硬直                                                 |
| CanMove*                 | 技能硬直时间内能否移动,可移动的技能全程需要同步位置(lizzy) |
| CanRotate*               | 同CanMove                                                  |
| CanInSky                 | 空中放技能?目前是否不用了?                                 |
| IsKillFx                 | 特效相关                                                   |
| IsKillLastFx             | 特效相关                                                   |
| BreakPriority*           | 技能打断权重                                               |
| CutSceneId               | 目前有cs功能吗?联机副本怎么播?                             |
| CameraEffectId           | 镜头特效                                                   |
| ChargingTime*            | 蓄力时间?                                                  |
| Target                   | 无用                                                       |
| IsStatic*                | 是否开启"时间静止"                                         |
| DelayStaticTime*         | 延后开始"时间静止"的时间                                   |
| StaticTime*              | "时间静止"持续时间                                         |
| StaticEffect             | "时间静止"的特效                                           |
| AuraReleaseId*           | 光环解放id,格式?                                           |
| SkillStatus*             | 技能状态:无敌,霸体                                         |
| IsPreAffect              | 起手段动作参数                                             |
| AtkPreBlendTime          | 起手段动作参数                                             |
| AtkPreTime*              | 起手段时间                                                 |
| AtkPreMoveType*          | 起手段选目标参数                                           |
| AtkPreShift*             | 起手段位移                                                 |
| AtkPreBackUpShift*       | 起手段备用位移                                             |
| AtkPreName               | 起手段动作名                                               |
| IsActAffect              | 攻击段动作参数                                             |
| AtkActBlendTime          | 攻击段动作参数                                             |
| AtkActTime*              | 攻击段时间                                                 |
| AtkMoveType*             | 攻击段选目标参数                                           |
| AtkActShift*             | 攻击段位移                                                 |
| AtkBackUpShift*          | 攻击段备用位移                                             |
| AtkActName               | 攻击段动作名                                               |
| IsEndAffect              | 收手段动作参数                                             |
| AtkEndBlendTime          | 收手段动作参数                                             |
| AtkEndTime*              | 收手段时间                                                 |
| AtkEndMoveType*          | 收手段选目标参数                                           |
| AtkEndShift*             | 收手段位移                                                 |
| AtkEndBackUpShift*       | 收手段备用位移                                             |
| AtkEndName               | 收手段动作名                                               |
| StallStyle               | 攻击顿帧参数                                               |
| StallConfig              | 攻击顿帧参数                                               |
| ExplodeBuff*             | 技能引爆buf?                                               |
| PreBuffs                 | 攻击开始加buf                                              |
| AftBuffs                 | 攻击结束加buf,攻击段被打断不加                             |
| PreAuras                 | 攻击开始加aura                                             |
| AftAuras                 | 攻击结束加aura,攻击段被打断不加                            |
| CollisionIDs             | 碰撞id(s)                                                  |
| FlyBombIDs               | 飞弹id(s)                                                  |
| EventParameter           | 技能事件,目前只有召唤npc                                   |
| PreSkill                 | 无用                                                       |
| RoleLevelReq             | 使用skill的前置条件,角色等级                               |
| StageReq                 | 使用skill的前置条件,角色品阶                               |
| RaceUpReq                | 使用skill的前置条件,角色强化                               |
| CareerChangeReq          | 使用skill的前置条件,角色转职                               |
| ItemReq                  | 无用                                                       |
| BuffCommand              | buff控制使用不同的skill                                    |
| Voice                    | 音效参数                                                   |
| EnergyConsume            | 无用                                                       |
# 三.表格字段详细说明

- SkillType:技能类型,参见不同skill的文档说明
  - 0  普通技能
  - 1  瞬闪技能
  - 2  治疗技能
  - 3  格挡技能
  - 4  冲刺技能
  - 5  蓄力技能
  - 6  多级蓄力技能
  - 7  自动位移技能
  - 8  光环解放
- SkillClass:技能分类,和SkillType无关(lizzy)
  - 0  普通技
  - 1  重击技
  - 2  蓄力技
  - 3  治疗技
  - 4  格挡技
  - 5  反击技
  - 6  闪避技
  - 7  特殊技
  - 8  必杀技
- PowerGet,PowerConsume
  - PowerGet
    - skill命中目标(攻击Box/飞弹)增加能量
    - 只加一次
    - 如果受击目标没有受击表现/不受伤害(无敌),可以加能量吗?
  - PowerConsume
    - 固定消耗模式(P)
      - 能量>=P,可以放skill,否则失败
    - 清空能量换伤害模式(P,N,M)
      - P  放skill所需能量最小值
      - N  每消耗N点能量,增加一个百分比M
      - M  技能伤害百分比
      - 技能伤害修正百分比=(CP-P)/N*M,CP为当前能量值
      - 浮点计算,还是整数计算?
    - skill起手段判断能量是否足够,进入攻击段,才扣能量
- ThreatType,ThreatRatio,ThreatRange
  - ThreatType:仇恨类型
    - 1  普通伤害产生的仇恨
    - 2  治疗产生的仇恨
    - 3  格挡产生的仇恨
  - ThreatRatio:仇恨系数
    - 对象给NPC造成伤害,NPC会给对象加"伤害值*仇恨系数"的伤害
    - 对象释放治疗技能,如果对象在NPC的仇恨列表中,NPC对对象的仇恨值会变为"当前仇恨值*仇恨系数"
  - ThreatRange:仇恨有效距离
    - 放skill的对象和NPC的距离在ThreatRange内,仇恨值才会变化
- ParrySkillId,ParryDirection
  - ParrySkillId:格挡反击skill id
    - skill格挡反击skill id;飞弹格挡反击skill id
  - ParryDirection:格挡方向
    - 0  正前方格挡
    - 1  全方位格挡
- UseCount
  - CD的同时使用次数,目前仅限于闪避?
- CD,SerialCD,SharedCoolDownID
  - CD  普通CD
  - SerialCD ?
  - SharedCoolDownID  公共CD
    - 公共CD的时间用哪个?
- BreakSpasticityPriority,BreakAttackSpasticity,BreakBeHitSpasticity
  - 放skill会有攻击硬直,受击时会有受击硬直,硬直时不能移动,不能放skill,可通过配置破攻击/受击硬直,放新skill
  - BreakAttackSpasticity:是否可破攻击硬直
  - BreakBeHitSpasticity:是否可破受击硬直
  - BreakSpasticityPriority:破硬直权重
    - 新skill配了相应的破硬直flag
    - 新skill的BreakSpasticityPriority>当前skill的BreakSpasticityPriority,可破攻击硬直
    - 新skill的BreakSpasticityPriority>造成当前受击状态的skill的BreakSpasticityPriority,可破受击硬直?
      - skill->飞弹->受击目标?
- CanMove,CanRotate
  - skill硬直过程中能否移动,转向
  - 如果配置可以,需要全程同步位移(skill三段)
- BreakPriority
  - skill打断权重
  - B正在放skill,A用skill/飞弹打B,如果A的skill/飞弹的BreakPriority>=B的skill的BreakPriority,则B的skill被打断
- ChargingTime
  - ?
- IsStatic,DelayStaticTime,StaticTime
  - IsStatic
    - 是否开启"时间静止"
  - DelayStaticTime
    - "时间静止"延后开始的时间,单位s,相对于skill攻击段开始?
  - StaticTime
    - "时间静止"持续时间,单位s
- AuraReleaseId
  - "光环解放"skill使用参数
  - 格式?
- SkillStatus
  - skill硬直开始(起手)就给施法者加flag,skill硬直结束/被切,取消flag
  - 联机副本,有概率会发生,客户端放出skill,加上flag了,但还是被击
    - 0  无效
    - 1  无敌
    - 2  霸体
- AtkPreTime,AtkActTime,AtkEndTime
  - skill三段的时长
- AtkPreMoveType,AtkMoveType,AtkEndMoveType
  - 选skill目标
    - 如果选出的目标不是当前锁定的目标,则设置为当前锁定的目标
    - 会影响到后续攻击Box选碰撞点
    - 因联机skill限制,最多只能有一段可以选目标,且必须在起手开始就选好
  - 
- AtkPreShift,AtkActShift,AtkEndShift
  - skill位移,选目标时使用
- AtkPreBackUpShift,AtkBackUpShift,AtkEndBackUpShift
  - skill备用位移,选目标时使用
- ExplodeBuff
  - skill引爆buff
  - 如果受击目标身上有指定的buff,则按buff层数,增加额外伤害
    - 格式:buffID,damage
    - 可多组
  - skill->飞弹->命中引爆buff
- PreBuffs,AftBuffs
  - 起手段开始加buff,格式:id,lv;id,lv...
  - 攻击段结束加buff,格式:id,lv;id,lv...
  - 联机副本,有概率发生在起手段加的buff,因skill被终止,而添加失败
- PreAuras,AftAuras
  - 起手段开始加aura,格式:id,lv;id,lv...
  - 攻击段结束加aura,格式:id,lv;id,lv...
  - 联机副本,有概率发生在起手段加的aura,因skill被终止,而添加失败
- EventParameter
  - 事件类型
    - 1  召唤NPC
  - 时间延迟时间,单位ms
    - 相对于?
  - 召唤的NPC id,lv
  - 世界坐标,位置,朝向
  - 坐标偏移
  - 随机半径
  - 存在时间,单位ms
  - 淡出时间,单位ms
  - 是否使用世界坐标系
    - 0  世界坐标系
    - 1  本地坐标系
  - 继承数值百分比[0,100]
  - 召唤单位仇恨规则
    - 0  受击单位对召唤者产生仇恨
    - 1  受击单位对被召唤单位产生仇恨
    - 2  a,b  受击单位产生的仇恨以a:b比例分摊到召唤者,被召唤单位身上
  - 仇恨是否转移
    - 0  被召唤单位消失后,被召唤单位的仇恨不转移到召唤者身上
    - 1  被召唤单位消失后,被召唤单位的仇恨转移到召唤者身上
- BuffCommand
  - 控制规则
    - 1  如果施法者身上有指定的buffID,Lv,释放指定skill
    - 2  如果施法者身上有指定的buffID,Lv,不能放skill
    - 3  如果施法者身上没有指定的buffID,Lv,不能放skill
  - 指定buff
    - buffID
  - buff等级
    - 0  不限制buff等级
    - 非0  指定的buff等级
  - 控制规则补充参数
    - 1       skillID,lv是?
    - 2/3:连击处理规则
      - 1/其他  连击中断
      - 2  忽略此skill,执行下一个连击skill