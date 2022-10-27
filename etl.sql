create or replace table RETAIL_POS as
select 
    case 
    when product_fmcg_category in ('Assorted Biscuits','Biscuit','Cookies','Crackers','Marie Biscuits','Other Biscuits','Stick Biscuits','Wafer') or contains(product_fmcg_category,'Snack') then 'Snacks'
    when product_fmcg_category in ('Coffee Beans','Coffee Powder') then 'Coffee Beans/Powder'
    when product_fmcg_category in ('Cup Yoghurt','Cup Yogurt','Drinking Yoghurt','Drinking Yogurt') then 'Yogurt'
    when product_fmcg_category in ('Face Makeup','Makeup - Face','Makeup - Lip','Eye Makeup') then 'Makeup'
    when product_fmcg_category in ('Sweetener','Sweeteners') then 'Sweetener'
    when product_fmcg_category in ('Prepared/Processed Foods','Prepared/Processed Foods (Canned)','Prepared/Processed Foods (Frozen)','Canned Food','Preserved Food','Dried Food') then 'Processed Food'
    when product_fmcg_category in ('Facial Moisturizer','Facial Moisturizing') then 'Facial Moisturizer' 
    when product_fmcg_category in ('Hair Colorant','Hair Coloring','Hair Conditioner','Hair Styling','Hair Treatment','Shampoo') then 'Hair Products'
    when product_fmcg_category in ('Toothbrush','Toothpaste','Mouthwash') then 'Oral Hygiene'
    when product_fmcg_category in ('Beer','Liquor','Spirit','Whisky','Vodka','Wine') then 'Alchohol'
    when product_fmcg_category in ('Seasoning','Seasoning Flour','Seasoning Liquid') then 'Seasoning'
    when product_fmcg_category in ('Facial Cotton','Facial Cleanser','Facial Mask','Facial Moisturizer','Facial Treatment','Eye Mask') then 'Face Care'
    when product_fmcg_category in ('Shaving Cream','Shaving Foam','Shaving Razor') then 'Shaving Products'
    when product_fmcg_category in ('Fabric Detergent','Fabric Freshener','Fabric Softener') then 'Fabric Care'
    when product_fmcg_category in ('Instant Noodle','Instant Porridge','Instant Soup','Instant Vermicelli') then 'Instant Noodles'
    when contains(product_fmcg_category,'Baby') then 'Baby Products'
    else product_fmcg_category end as category,*
from fmcg_retail_indo.public.raw_mp_id_fmcg where product_fmcg_category not in ('-','Null','')
