#
# Copyright (c) 2017 joshua stein <jcs@jcs.org>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

class Folder < DBModel
  set_table_name "folders"
  set_primary_key "uuid"

  attr_writer :user

  def to_hash
    {
      "Id" => self.uuid,
      "RevisionDate" => self.updated_at.strftime("%Y-%m-%dT%H:%M:%S.000000Z"),
      "Name" => self.name.to_s,
      "Object" => "folder",
    }
  end

  def update_from_params(params)
    self.name = params[:name]
  end

  def user
    @user ||= User.find_by_uuid(self.user_uuid)
  end
end
