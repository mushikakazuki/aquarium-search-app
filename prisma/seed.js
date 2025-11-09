import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

async function main() {
  // 例: Aquarium 追加
    const aquarium = await prisma.aquarium.create({
        data: {
            name: "仙台うみの杜水族館",
            name_kana: "センダイウミノモリ",
            prefectures: "Miyagi",
            address: "宮城県仙台市…",
            latitude: 38.289,
            longitude: 141.036,

            aquariumInfo: {
                create: {
                    officialWebsiteURL: "https://www.uminomori.jp/umino/index.html",
                    isJAZAFlag: false,
                }
            },

            organisms: {
                create: [
                    { name: "ケープペンギン" },
                    { name: "バンドウイルカ" },
                    { name: "ホシエイ" },
                ]
            },

            hours: {
                create: [
                    { 
                        dayOfWeek: '全日',
                        openTime: new Date("1970-01-01T10:00:00"),
                        closeTime: new Date("1970-01-01T17:00:00"),
                    },
                ]
            },

            shows: {
                create: [
                    {
                        name: 'イルカ・アシカ・バードパフォーマンス',
                    },
                    {
                        name: 'マイワシショー（Sparkling of Life）',
                    },
                    {
                        name: 'オタリアフレンドリータイム',
                    },
                    {
                        name: 'ペンギンフレンドリータイム',
                    },
                ]
            }
        }
    })
    await prisma.priceType.createMany({
    data: [
        { type: '一律' },
        { type: '大人' },
        { type: '中高生' },
        { type: '小学生' },
        { type: '幼児' },
        { type: 'シニア' },
        { type: '障がい者' },
        { type: '年間パス' },
    ]
    })

    // 料金
    await prisma.price.createMany({
        data: [
            { aquariumId: aquarium.id, priceTypeId: 2, price: 2400 },
            { aquariumId: aquarium.id, priceTypeId: 3, price: 1700 },
            { aquariumId: aquarium.id, priceTypeId: 4, price: 1200 },
            { aquariumId: aquarium.id, priceTypeId: 5, price: 700 },
            { aquariumId: aquarium.id, priceTypeId: 6, price: 1800 },
        ]
    })
}



main()
.then(() => prisma.$disconnect())
.catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
})
