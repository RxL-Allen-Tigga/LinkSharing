package LinkSharing

import grails.gorm.transactions.Transactional

@Transactional
class LoginMiscellaneousService {

    def getLoginData() {
//        Recently shared resources (Recent Shares)
        def resourcex = LS_Resource.executeQuery("""
            select r
            from LS_Resource r
            join r.topic t
            where t.isDeleted = false
                and t.visibility = 'PUBLIC'
                and r.isDeleted = false
            order by r.dateCreated desc
            """, [max: 5])

//        Top posts depending upon average rating (Top Trending Posts)
        def results = LS_Resource.executeQuery('''
            SELECT r.id, AVG(rr.score)
            FROM LS_Resource r
            JOIN r.topic t
            LEFT JOIN ResourceRating rr 
                ON rr.resource = r AND rr.isDeleted = false
                    WHERE r.isDeleted = false AND t.isDeleted = false AND t.visibility = :publicVisibility
            GROUP BY r.id
            ORDER BY AVG(rr.score) ASC
            ''', [publicVisibility: LinkSharing.Topic.Visibility.PUBLIC], [max: 5])
        def topResourcesWithAvg = results.collect { row ->
            def id = row[0]
            def avg = row[1]
            [resource: LS_Resource.get(id), average: avg]
        }.sort { -(it.average ?: 0) }  // ✅ safely sort by average

        return [
                resourcex          : resourcex,
                topResourcesWithAvg: topResourcesWithAvg
        ]

    }
}