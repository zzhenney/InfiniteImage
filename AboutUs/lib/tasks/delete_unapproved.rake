# 7/18/18     Paul Ancajima
task delete_unapproved: :environment do            #task is to delete unapproved images in rails environment
  Image.where(status_id: 2).delete_all             #0 pending, 1 approved, 2 unapproved
end
