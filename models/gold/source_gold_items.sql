select
*
from
{{ source('source', 'items') }}
qualify row_number() over (partition by id order by updatedDate desc) = 1